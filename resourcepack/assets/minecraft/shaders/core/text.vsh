#version 330

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:sample_lightmap.glsl>
#endif

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
in ivec2 UV2;
#endif

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
uniform sampler2D Sampler2;
out float sphericalVertexDistance;
out float cylindricalVertexDistance;
#endif

out vec4 vertexColor;
out vec2 texCoord0;
out vec2 vignetteCoord;
out float custom;

const vec2[4] uvCorners = vec2[4](
    vec2(0.0, 0.0), // Top-Left (Full 0..1 UV quad for portrait.glsl)
    vec2(0.0, 1.0), // Bottom-Left
    vec2(1.0, 1.0), // Bottom-Right
    vec2(1.0, 0.0)  // Top-Right
);

void main() {
    texCoord0 = UV0;
    vertexColor = Color;
    custom = 0.0;
    vignetteCoord = vec2(0.0);
    vec3 pos = Position;

    float guiWidth = 2.0 / ProjMat[0][0];
    float guiHeight = abs(2.0 / ProjMat[1][1]);
    bool isRotated = (abs(ModelViewMat[0][1]) > 0.01 || abs(ModelViewMat[1][0]) > 0.01);

    ivec4 c = ivec4(round(Color * 255.0));
    int vId = gl_VertexID % 4;

    // === GOURD GUARD HUD SYSTEM (#01xxxx -> rByte == 1) ===
    int rByte = c.r;
    bool isHud = (rByte == 1);

    if (isHud) {
        int gByte = c.g;
        int bByte = c.b;

        // Base Actionbar text center normalization
        float originX = pos.x - (guiWidth * 0.5);
        float originY = pos.y - (guiHeight - 68.0);

        // --- SECTION A: Bottom-Left Objective HUD (#01AAxx, gByte == 170) ---
        if (gByte == 170) {
            // #01AA00: Pumpkin Icon (\uE100) - 28x28px at (X: 20px, Y: guiHeight - 46px)
            if (bByte == 0) {
                pos.x = (vId == 0 || vId == 1) ? 20.0 : 48.0;
                pos.y = (vId == 0 || vId == 3) ? (guiHeight - 46.0) : (guiHeight - 18.0);
                pos.z = 0.0;
            }
            // #01AA01: Health Bar (\uE101 to \uE115) - 86x16px at (X: 54px, Y: guiHeight - 40px)
            else if (bByte == 1) {
                pos.x = (vId == 0 || vId == 1) ? 54.0 : 140.0;
                pos.y = (vId == 0 || vId == 3) ? (guiHeight - 40.0) : (guiHeight - 24.0);
                pos.z = 0.0;
            }
            vertexColor = vec4(1.0);
        }
        // --- SECTION C: Top-Right Wave & Mob HUD ---
        // Main Text (#01BBxx, gByte == 187) & Shadow (#012Exx, gByte == 46)
        else if (gByte == 187 || gByte == 46) {
            // #01BB00: Hanging Sign Background (\uE200) - 156x132px at Top-Right
            if (bByte == 0) {
                pos.x = (vId == 0 || vId == 1) ? (guiWidth - 172.0) : (guiWidth - 16.0);
                pos.y = (vId == 0 || vId == 3) ? 0.0 : 132.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01BB01 (Main) / #012E01 (Shadow): Top Board "WAVE " Text - Scaled 1.85x at (X: guiWidth - 104px, Y: 55px)
            else if (bByte == 1) {
                float waveScale = 1.85;
                pos.x = originX * waveScale + (guiWidth - 104.0);
                pos.y = originY * waveScale + 55.0;
                pos.z = 0.0;
                vertexColor.rgb = (gByte == 46) ? vec3(0.25) : vec3(1.0); // Pure White
            }
            // #01BB04 (Main) / #012E04 (Shadow): Top Board Wave Score Number - Scaled 1.85x at (X: guiWidth - 104px, Y: 55px)
            else if (bByte == 4) {
                float waveScale = 1.85;
                pos.x = originX * waveScale + (guiWidth - 104.0);
                pos.y = originY * waveScale + 55.0;
                pos.z = 0.0;
                vertexColor.rgb = (gByte == 46) ? vec3(0.0, 0.1675, 0.1675) : vec3(0.0, 0.67, 0.67); // Dark Aqua (#00AAAA)
            }
            // #01BB02: Bottom Board Ghost Icon (\uE201) - 14x14px at (X: guiWidth - 110px, Y: 103px..117px)
            else if (bByte == 2) {
                pos.x = (vId == 0 || vId == 1) ? (guiWidth - 110.0) : (guiWidth - 96.0);
                pos.y = (vId == 0 || vId == 3) ? 103.0 : 117.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01BB03 (Main) / #012E03 (Shadow): Bottom Board Mob Count Digits - Scaled 1.4x at (X: guiWidth - 81px, Y: 109px)
            else if (bByte == 3) {
                float mobScale = 1.4;
                pos.x = originX * mobScale + (guiWidth - 81.0);
                pos.y = originY * mobScale + 109.0;
                pos.z = 0.0;
                vertexColor.rgb = (gByte == 46) ? vec3(0.18) : vec3(0.70, 0.70, 0.70); // Gray
            }
        }
        // --- SECTION B: Top-Left Match HUD ---
        // #01FFFF: Wooden Background Frame (\uE001) - 132x188px at (X: 2px, Y: 2px)
        else if (Color.g > 0.8 && Color.b > 0.8) {
            pos.x = (vId == 0 || vId == 1) ? 2.0 : 134.0;
            pos.y = (vId == 0 || vId == 3) ? 2.0 : 190.0;
            pos.z = 0.0;
            vertexColor = vec4(1.0);
        }
        // #010000: JNNGL GUI Avatar (56x56px at X: 42px..98px, Y: 68px..124px)
        else if (Color.g < 0.05 && Color.b < 0.05 && bByte == 0) {
            texCoord0 = uvCorners[vId];
            custom = 1.0;
            pos.x = (vId == 0 || vId == 1) ? 42.0 : 98.0;
            pos.y = (vId == 0 || vId == 3) ? 68.0 : 124.0;
            pos.z = 0.0;
            vertexColor = vec4(1.0);
        }
        // Timer Row & Popups: Main (bByte > 250) or Shadow (bByte >= 60 && bByte <= 63)
        else if (bByte > 250 || (bByte >= 60 && bByte <= 63)) {
            // #0100FE: Stopwatch Icon (\uE003) - 14x14px at (X: 44px..58px, Y: 30px..44px)
            if (bByte == 254) {
                pos.x = (vId == 0 || vId == 1) ? 44.0 : 58.0;
                pos.y = (vId == 0 || vId == 3) ? 30.0 : 44.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #0100FD (Main) / #01003D (Shadow): Coin Gain Pop-Up (+XX)
            else if (bByte == 253 || bByte == 61) {
                pos.x = originX + 97.0;
                pos.y = originY + 140.0;
                pos.z = 0.0;
                vertexColor.rgb = (bByte == 61) ? vec3(0.0825, 0.25, 0.0825) : vec3(0.33, 1.0, 0.33);
            }
            // #0100FC (Main) / #01003C (Shadow): Coin Loss Pop-Up (-XX)
            else if (bByte == 252 || bByte == 60) {
                pos.x = originX + 97.0;
                pos.y = originY + 140.0;
                pos.z = 0.0;
                vertexColor.rgb = (bByte == 60) ? vec3(0.25, 0.0625, 0.0625) : vec3(1.0, 0.25, 0.25);
            }
            // Timer Digits: at (X: 67px, Y: 38px)
            else {
                pos.x = originX + 67.0;
                pos.y = originY + 38.0;
                pos.z = 0.0;
                bool isShadow = (bByte == 63);
                if (isShadow) {
                    if (gByte == 0) vertexColor.rgb = vec3(0.0825, 0.25, 0.0825);      // Green Shadow
                    else if (gByte == 1) vertexColor.rgb = vec3(0.25, 0.25, 0.0825); // Yellow Shadow
                    else if (gByte == 2) vertexColor.rgb = vec3(0.25, 0.1675, 0.0);   // Orange Shadow
                    else if (gByte == 3) vertexColor.rgb = vec3(0.25, 0.0625, 0.0625); // Red Shadow
                } else {
                    if (gByte == 0) vertexColor.rgb = vec3(0.33, 1.0, 0.33);      // Green (> 2m)
                    else if (gByte == 1) vertexColor.rgb = vec3(1.0, 1.0, 0.33); // Yellow (1m-2m)
                    else if (gByte == 2) vertexColor.rgb = vec3(1.0, 0.67, 0.0);  // Orange (30s-1m)
                    else if (gByte == 3) vertexColor.rgb = vec3(1.0, 0.25, 0.25); // Red (< 30s)
                }
            }
        }
        // Candy Row: Main (gByte == 255 || gByte == 254) or Shadow (gByte == 62)
        else if (gByte == 255 || gByte == 254 || gByte == 62) {
            // #01FF00: Candy Icon (\uE002) - 16x16px at (X: 40px..56px, Y: 139px..155px)
            if (gByte == 255) {
                pos.x = (vId == 0 || vId == 1) ? 40.0 : 56.0;
                pos.y = (vId == 0 || vId == 3) ? 139.0 : 155.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01FE00 (Main) / #013E00 (Shadow): Candy Score Digits at (X: 70px, Y: 147px)
            else {
                pos.x = originX + 70.0;
                pos.y = originY + 147.0;
                pos.z = 0.0;
                vertexColor.rgb = (gByte == 62) ? vec3(0.25) : vec3(1.0);
            }
        }
    }
    // === CHATBOX DIALOGUE & SHOP SYSTEM ===
    else {
        // 1. Vignette quad tagged with #FBFBFA (rgb 251, 251, 250)
        bool isVignette = (!isRotated && c.r == 251 && c.g == 251 && c.b == 250);

        if (isVignette) {
            int corner = gl_VertexID % 4;
            if (corner == 0) {
                pos.xy = vec2(0.0, 0.0);
                vignetteCoord = vec2(0.0, 0.0);
            } else if (corner == 1) {
                pos.xy = vec2(0.0, guiHeight);
                vignetteCoord = vec2(0.0, 1.0);
            } else if (corner == 2) {
                pos.xy = vec2(guiWidth, guiHeight);
                vignetteCoord = vec2(1.0, 1.0);
            } else {
                pos.xy = vec2(guiWidth, 0.0);
                vignetteCoord = vec2(1.0, 0.0);
            }
        }

        // 2. Shop rows in bossbars 4..12:
        // Strictly identified by Shop UI color signatures and their unique drop shadows in vertical band [75.0, 260.0]
        bool isShop = (!isVignette && !isRotated && abs(pos.z) < 0.1 && abs(pos.x - (guiWidth * 0.5)) <= 350.0 && pos.y >= 75.0 && pos.y <= 260.0 &&
            (
                // Shop Row Backgrounds & Item Icons (#FBFBA4 / #FBFBA5 / #FBFBA6) & drop shadows (b in 41..42)
                (c.r == 251 && c.g == 251 && (c.b >= 164 && c.b <= 166)) ||
                ((c.r == 62 || c.r == 63) && (c.g == 62 || c.g == 63) && (c.b == 41 || c.b == 42)) ||
                // Slot tags (#FFE082 / #A0887E) & drop shadows
                (c.r == 255 && c.g == 224 && c.b == 130) ||
                ((c.r == 63 || c.r == 64) && c.g == 56 && (c.b == 32 || c.b == 33)) ||
                (c.r == 160 && c.g == 136 && c.b == 126) ||
                (c.r == 40 && c.g == 34 && (c.b == 31 || c.b == 32)) ||
                // Item Names (#FFF5C5 / #D7CCC8) & drop shadows
                (c.r == 255 && c.g == 245 && c.b == 197) ||
                ((c.r == 63 || c.r == 64) && c.g == 61 && c.b == 49) ||
                (c.r == 215 && c.g == 204 && c.b == 200) ||
                ((c.r == 53 || c.r == 54) && c.g == 51 && c.b == 50) ||
                // Prices (#FFD54F / #FFB74D / #CF6679) & drop shadows
                (c.r == 255 && c.g == 213 && c.b == 79) ||
                ((c.r == 63 || c.r == 64) && c.g == 53 && (c.b == 19 || c.b == 20)) ||
                (c.r == 255 && c.g == 183 && c.b == 77) ||
                ((c.r == 63 || c.r == 64) && (c.g == 45 || c.g == 46) && c.b == 19) ||
                (c.r == 207 && c.g == 102 && c.b == 121) ||
                ((c.r == 51 || c.r == 52) && (c.g == 25 || c.g == 26) && c.b == 30) ||
                // Buttons (#69F0AE / #FF5252) & drop shadows
                (c.r == 105 && c.g == 240 && c.b == 174) ||
                (c.r == 26 && c.g == 60 && (c.b == 43 || c.b == 44)) ||
                (c.r == 255 && c.g == 82  && c.b == 82) ||
                ((c.r == 63 || c.r == 64) && (c.g == 20 || c.g == 21) && (c.b == 20 || c.b == 21))
            )
        );

        if (isShop) {
            int k = int(floor((pos.y - 75.0) / 19.0));
            if (k < 0) k = 0;
            if (k > 8) k = 8;
            float deltaY = (guiHeight - 161.0) - (float(k) * 37.0);
            pos.y += deltaY;
        }

        // 3. Dialogue box:
        // Bossbars 0..3 (Background frame, avatar, [SHIFT] icon, dialogue lines 0..2)
        // All vertices of dialogue elements and their drop shadows reside strictly in pos.y in [5.0, 105.0]
        bool isDialogue = (!isVignette && !isShop && !isRotated && abs(pos.z) < 0.1 && abs(pos.x - (guiWidth * 0.5)) <= 220.0 && pos.y >= 5.0 && pos.y <= 105.0);

        if (isDialogue) {
            float deltaY = guiHeight - 151.0;
            pos.y += deltaY;
        }
    }

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
    sphericalVertexDistance = fog_spherical_distance(pos);
    cylindricalVertexDistance = fog_cylindrical_distance(pos);
    vertexColor = Color * sample_lightmap(Sampler2, UV2);
#else
    if (c.r == 251 && c.g == 251 && (c.b >= 164 && c.b <= 166)) {
        vertexColor = vec4(1.0, 1.0, 1.0, Color.a);
    } else if (!isHud) {
        vertexColor = Color;
    }
#endif
}