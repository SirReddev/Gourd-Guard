#version 330
#extension GL_ARB_separate_shader_objects : require

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#include <minecraft:fog.glsl>
#include <minecraft:sample_lightmap.glsl>
#endif

#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>

layout(location = 0) in vec3 Position;
layout(location = 1) in vec4 Color;
layout(location = 2) in vec2 UV0;
#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
layout(location = 3) in ivec2 UV2;
#endif

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
uniform sampler2D Sampler2;
layout(location = 0) out float sphericalVertexDistance;
layout(location = 1) out float cylindricalVertexDistance;
layout(location = 2) out vec4 vertexColor;
layout(location = 3) out vec2 texCoord0;
layout(location = 4) out vec2 vignetteCoord;
layout(location = 5) out float custom;
#else
layout(location = 0) out vec4 vertexColor;
layout(location = 1) out vec2 texCoord0;
layout(location = 2) out vec2 vignetteCoord;
layout(location = 3) out float custom;
#endif

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
            // #01AA00: Pumpkin Icon (\uE100) - 28x28px at (X: 16px, Y: guiHeight - 44px)
            if (bByte == 0) {
                pos.x = (originX + 8.0) * (28.0 / 18.0) + 16.0;
                pos.y = (originY + 15.0) * (28.0 / 18.0) + (guiHeight - 44.0);
                pos.z = 0.0;
            }
            // #01AA01: Health Bar (\uE101 to \uE115) - wider & more right (X: 58px, Y: guiHeight - 38px)
            else if (bByte == 1) {
                pos.x = (originX + 6.0) * 1.15 + 58.0;
                pos.y = (originY + 10.0) * (18.0 / 10.0) + (guiHeight - 38.0);
                pos.z = 0.0;
            }
            vertexColor = vec4(1.0);
        }
        // --- SECTION C: Top-Right Wave & Mob HUD ---
        // Main Text (#01BBxx, gByte == 187) & Shadow (#012Exx, gByte == 46)
        else if (gByte == 187 || gByte == 46) {
            // #01BB00: Hanging Sign Background (\uE200) - 156x132px at Top-Right
            if (bByte == 0) {
                pos.x = (originX + 1.5) * 6.0 + (guiWidth - 145.0);
                pos.y = (originY + 18.0) * 6.0 - 6.0;
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
                pos.x = (originX - 12.0) + (guiWidth - 110.0);
                pos.y = (originY + 10.0) * (14.0 / 12.0) + 103.0;
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
        // #01FFFF: Wooden Background Frame (\uE001) - 132x188px at (X: -12px, Y: -10px)
        else if (Color.g > 0.8 && Color.b > 0.8) {
            pos.x = originX - 12.0;
            pos.y = originY + 142.0;
            pos.z = 0.0;
            vertexColor = vec4(1.0);
        }
        // #010000: JNNGL GUI Avatar (56x56px at X: 28px..84px, Y: 56px..112px)
        else if (Color.g < 0.05 && Color.b < 0.05 && bByte == 0) {
            pos.x = (originX + 4.0) * 7.0 + 28.0;
            pos.y = (originY + 6.0) * 7.0 + 56.0;
            pos.z = 0.0;
            texCoord0 = clamp(vec2((originX + 4.0) / 8.0, (originY + 6.0) / 8.0), 0.0, 1.0);
            custom = 1.0;
            vertexColor = vec4(1.0);
        }
        // Timer Row & Popups: Main (bByte > 250) or Shadow (bByte >= 60 && bByte <= 63)
        else if (bByte > 250 || (bByte >= 60 && bByte <= 63)) {
            // #0100FE: Stopwatch Icon (\uE003) - 14x14px at (X: 30px..44px, Y: 18px..32px)
            if (bByte == 254) {
                pos.x = originX + 30.0;
                pos.y = originY + 30.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #0100FD (Main) / #01003D (Shadow): Coin Gain Pop-Up (+XX)
            else if (bByte == 253 || bByte == 61) {
                pos.x = originX + 83.0;
                pos.y = originY + 128.0;
                pos.z = 0.0;
                vertexColor.rgb = (bByte == 61) ? vec3(0.0825, 0.25, 0.0825) : vec3(0.33, 1.0, 0.33);
            }
            // #0100FC (Main) / #01003C (Shadow): Coin Loss Pop-Up (-XX)
            else if (bByte == 252 || bByte == 60) {
                pos.x = originX + 83.0;
                pos.y = originY + 128.0;
                pos.z = 0.0;
                vertexColor.rgb = (bByte == 60) ? vec3(0.25, 0.0625, 0.0625) : vec3(1.0, 0.25, 0.25);
            }
            // Timer Digits: at (X: 53px, Y: 26px)
            else {
                pos.x = originX + 53.0;
                pos.y = originY + 26.0;
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
            // #01FF00: Candy Icon (\uE002) - 16x16px at (X: 26px..42px, Y: 127px..143px)
            if (gByte == 255) {
                pos.x = (originX + 2.0) + 26.0;
                pos.y = originY + 139.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01FE00 (Main) / #013E00 (Shadow): Candy Score Digits at (X: 56px, Y: 135px)
            else {
                pos.x = originX + 56.0;
                pos.y = originY + 135.0;
                pos.z = 0.0;
                vertexColor.rgb = (gByte == 62) ? vec3(0.25) : vec3(1.0);
            }
        }
    }
    // === CHATBOX DIALOGUE & SHOP SYSTEM ===
    else {
        // Strict exclusion list of vanilla UI / menu text colors and their drop shadows:
        bool isVanillaMenuColor = (
            // Pure White (Menu Titles & Buttons) + Drop Shadow
            (c.r == 255 && c.g == 255 && c.b == 255) ||
            ((c.r == 63 || c.r == 64) && (c.g == 63 || c.g == 64) && (c.b == 63 || c.b == 64)) ||
            // Light Gray (List Items, Options, Descriptions) + Drop Shadow
            (c.r == 170 && c.g == 170 && c.b == 170) ||
            (c.r == 42 && c.g == 42 && c.b == 42) ||
            // Dark Gray (Disabled buttons, headers) + Drop Shadow
            (c.r == 85 && c.g == 85 && c.b == 85) ||
            (c.r == 21 && c.g == 21 && c.b == 21) ||
            // Gray tones
            (c.r == 128 && c.g == 128 && c.b == 128) ||
            (c.r == 32 && c.g == 32 && c.b == 32) ||
            (c.r == 160 && c.g == 160 && c.b == 160) ||
            (c.r == 40 && c.g == 40 && c.b == 40) ||
            (c.r == 64 && c.g == 64 && c.b == 64) ||
            (c.r == 16 && c.g == 16 && c.b == 16) ||
            (c.r == 215 && c.g == 215 && c.b == 215) ||
            (c.r == 53 && c.g == 53 && c.b == 53) ||
            // Yellow (Hovered list items, splash text) + Drop Shadow
            (c.r == 255 && c.g == 255 && c.b == 160) ||
            (c.r == 63 && c.g == 63 && c.b == 40) ||
            (c.r == 255 && c.g == 255 && c.b == 85) ||
            (c.r == 63 && c.g == 63 && c.b == 21) ||
            (c.r == 255 && c.g == 255 && c.b == 0) ||
            (c.r == 63 && c.g == 63 && c.b == 0) ||
            // Gold
            (c.r == 255 && c.g == 170 && c.b == 0) ||
            (c.r == 63 && c.g == 42 && c.b == 0) ||
            // Red (Incompatible resource packs, error text) + Drop Shadow
            (c.r == 255 && c.g == 85 && c.b == 85) ||
            (c.r == 63 && c.g == 21 && c.b == 21) ||
            (c.r == 170 && c.g == 0 && c.b == 0) ||
            (c.r == 42 && c.g == 0 && c.b == 0) ||
            // Black
            (c.r == 0 && c.g == 0 && c.b == 0)
        );

        // 1. Vignette quad tagged with #FBFBFA (rgb 251, 251, 250)
        bool isVignette = (!isRotated && c.r == 251 && c.g == 251 && c.b == 250);

        if (isVignette) {
            bool isLeft = (pos.x < guiWidth * 0.5);
            bool isTop = (pos.y < guiHeight * 0.5);
            pos.xy = vec2(isLeft ? 0.0 : guiWidth, isTop ? 0.0 : guiHeight);
            vignetteCoord = vec2(isLeft ? 0.0 : 1.0, isTop ? 0.0 : 1.0);
        }

        // 2. Shop rows in bossbars 4..12:
        // Strictly identified by ChatBox Shop UI color signatures and their unique drop shadows in vertical band [65.0, 260.0]
        bool isShop = (!isVignette && !isRotated && abs(pos.z) < 0.1 && abs(pos.x - (guiWidth * 0.5)) <= 350.0 && pos.y >= 65.0 && pos.y <= 260.0 &&
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
            int k = int(floor((pos.y - 73.0) / 19.0));
            if (k < 0) k = 0;
            if (k > 8) k = 8;
            float deltaY = (guiHeight - 228.0) + (float(k) * 2.0);
            pos.y += deltaY;
        }

        // 3. Dialogue box:
        // Bossbars 0..3 (Background frame, avatar, [SHIFT] icon, dialogue lines 0..2)
        // ChatBox signature color is #FBFBFB (rgb 251, 251, 251 and shadow 62, 62, 62)
        bool isChatBoxColor = (
            // Base ChatBox #FBFBFB (rgb 251, 251, 251) and shadow (rgb 62, 62, 62)
            (c.r == 251 && c.g == 251 && c.b == 251) ||
            (c.r == 62 && c.g == 62 && c.b == 62) ||
            // Formatted dialogue text colors in test sequences:
            (c.r == 255 && c.g == 58 && c.b == 58) ||   // #FF3A3A Red (test/0)
            (c.r == 63 && c.g == 14 && c.b == 14) ||    // Shadow
            (c.r == 255 && c.g == 68 && c.b == 68) ||   // #FF4444 Red (test/3)
            (c.r == 63 && c.g == 17 && c.b == 17) ||    // Shadow
            (c.r == 119 && c.g == 119 && c.b == 119) || // #777777 Gray (test/1)
            (c.r == 29 && c.g == 29 && c.b == 29) ||    // Shadow
            (c.r == 187 && c.g == 187 && c.b == 187) || // #BBBBBB Light Gray (test/0, test/1)
            (c.r == 46 && c.g == 46 && c.b == 46) ||    // Shadow
            (c.r == 58 && c.g == 100 && c.b == 255) ||  // #3A64FF Blue (test/0)
            (c.r == 14 && c.g == 25 && c.b == 63) ||    // Shadow
            (c.r == 94 && c.g == 255 && c.b == 58) ||   // #5EFF3A Green (test/0)
            (c.r == 23 && c.g == 63 && c.b == 14) ||    // Shadow
            (c.r == 85 && c.g == 255 && c.b == 85) ||   // #55FF55 Bright Green (test/3, story)
            (c.r == 21 && c.g == 63 && c.b == 21)       // Shadow
        );

        // Centered horizontally within 125px (dialogue frame is 236px wide -> 118px from center)
        // pos.y between 5.0 and 105.0 (covers frame, lines 0..2, and shift icon with ascent -74)
        bool isDialogue = (!isVignette && !isShop && !isRotated && abs(pos.z) < 0.1 &&
            abs(pos.x - (guiWidth * 0.5)) <= 125.0 &&
            pos.y >= 5.0 && pos.y <= 105.0 &&
            (isChatBoxColor || !isVanillaMenuColor)
        );

        if (isDialogue) {
            float deltaY = guiHeight - 151.0;
            pos.y += deltaY;
        }
    }

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
    sphericalVertexDistance = fog_spherical_distance(pos);
    cylindricalVertexDistance = fog_cylindrical_distance(pos);
    if (c.r == 251 && c.g == 251 && (c.b >= 164 && c.b <= 166)) {
        vertexColor = vec4(1.0, 1.0, 1.0, Color.a) * sample_lightmap(Sampler2, UV2);
    } else {
        vertexColor = Color * sample_lightmap(Sampler2, UV2);
    }
#else
    if (c.r == 251 && c.g == 251 && (c.b >= 164 && c.b <= 166)) {
        vertexColor = vec4(1.0, 1.0, 1.0, Color.a);
    } else if (!isHud) {
        vertexColor = Color;
    }
#endif
}