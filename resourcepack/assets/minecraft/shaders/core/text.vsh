#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler0;

out vec4 vertexColor;
out vec2 texCoord0;
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
    vec3 pos = Position;

    // Color marker: #01xxxx -> rByte == 1
    int rByte = int(round(Color.r * 255.0));
    bool isHud = (rByte == 1);

    if (isHud) {
        float guiWidth = 2.0 / ProjMat[0][0];
        float guiHeight = abs(2.0 / ProjMat[1][1]);
        int vId = gl_VertexID % 4;

        int gByte = int(round(Color.g * 255.0));
        int bByte = int(round(Color.b * 255.0));

        // Base Actionbar text center normalization
        float originX = pos.x - (guiWidth * 0.5);
        float originY = pos.y - (guiHeight - 68.0);

        // === SECTION A: Bottom-Left Objective HUD (#01AAxx, gByte == 170) ===
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
        // === SECTION C: Top-Right Wave & Mob HUD (#01BBxx, gByte == 187) ===
        else if (gByte == 187) {
            // #01BB00: Hanging Sign Background (\uE200) - 156x132px at Top-Right
            if (bByte == 0) {
                pos.x = (vId == 0 || vId == 1) ? (guiWidth - 172.0) : (guiWidth - 16.0);
                pos.y = (vId == 0 || vId == 3) ? 0.0 : 132.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01BB01: Top Board Text ("WAVE " + score) - Scaled 1.85x, Shifted 1px up & left (X: guiWidth - 113px, Y: 55px)
            else if (bByte == 1) {
                float waveScale = 1.85;
                pos.x = originX * waveScale + (guiWidth - 113.0);
                pos.y = originY * waveScale + 55.0;
                pos.z = 0.0;
                vertexColor.rgb = vec3(1.0, 1.0, 1.0); // Pure White
            }
            // #01BB02: Bottom Board Ghost Icon (\uE201) - 14x14px at (X: guiWidth - 113px, Y: 103px..117px)
            else if (bByte == 2) {
                pos.x = (vId == 0 || vId == 1) ? (guiWidth - 113.0) : (guiWidth - 99.0);
                pos.y = (vId == 0 || vId == 3) ? 103.0 : 117.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01BB03: Bottom Board Mob Count Digits - Scaled 1.4x, Shifted at (X: guiWidth - 87px, Y: 109px)
            else if (bByte == 3) {
                float mobScale = 1.4;
                pos.x = originX * mobScale + (guiWidth - 87.0);
                pos.y = originY * mobScale + 109.0;
                pos.z = 0.0;
                vertexColor.rgb = vec3(1.0, 1.0, 1.0); // Pure White
            }
        }
        // === SECTION B: Top-Left Match HUD ===
        // #01FFFF: Wooden Background Frame (\uE001) - 132x188px at (X: 2px, Y: 2px)
        else if (Color.g > 0.8 && Color.b > 0.8) {
            pos.x = (vId == 0 || vId == 1) ? 2.0 : 134.0;
            pos.y = (vId == 0 || vId == 3) ? 2.0 : 190.0;
            pos.z = 0.0;
            vertexColor = vec4(1.0);
        }
        // #010000: JNNGL GUI Avatar (56x56px at X: 41px..97px, Y: 68px..124px)
        else if (Color.g < 0.05 && Color.b < 0.05) {
            texCoord0 = uvCorners[vId];
            custom = 1.0;
            pos.x = (vId == 0 || vId == 1) ? 41.0 : 97.0;
            pos.y = (vId == 0 || vId == 3) ? 68.0 : 124.0;
            pos.z = 0.0;
            vertexColor = vec4(1.0);
        }
        // Timer Row: Color.b > 0.8
        else if (Color.b > 0.8) {
            // #0100FE: Stopwatch Icon (\uE003) - 14x14px at (X: 44px..58px, Y: 30px..44px)
            if (bByte == 254) {
                pos.x = (vId == 0 || vId == 1) ? 44.0 : 58.0;
                pos.y = (vId == 0 || vId == 3) ? 30.0 : 44.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #0100FD: Coin Gain Pop-Up (+XX)
            else if (bByte == 253) {
                pos.x = originX + 71.0;
                pos.y = originY + 133.0;
                pos.z = 0.0;
                vertexColor.rgb = vec3(0.33, 1.0, 0.33);
            }
            // #0100FC: Coin Loss Pop-Up (-XX)
            else if (bByte == 252) {
                pos.x = originX + 71.0;
                pos.y = originY + 133.0;
                pos.z = 0.0;
                vertexColor.rgb = vec3(1.0, 0.25, 0.25);
            }
            // Timer Digits: at (X: 69px, Y: 38px)
            else {
                pos.x = originX + 69.0;
                pos.y = originY + 38.0;
                pos.z = 0.0;
                if (gByte == 0) vertexColor.rgb = vec3(0.33, 1.0, 0.33);      // Green (> 2m)
                else if (gByte == 1) vertexColor.rgb = vec3(1.0, 1.0, 0.33); // Yellow (1m-2m)
                else if (gByte == 2) vertexColor.rgb = vec3(1.0, 0.67, 0.0);  // Orange (30s-1m)
                else if (gByte == 3) vertexColor.rgb = vec3(1.0, 0.25, 0.25); // Red (< 30s)
            }
        }
        // Candy Row: Color.g > 0.8 && Color.b < 0.2
        else if (Color.g > 0.8 && Color.b < 0.2) {
            // #01FF00: Candy Icon (\uE002) - 16x16px at (X: 40px..56px, Y: 139px..155px)
            if (gByte == 255) {
                pos.x = (vId == 0 || vId == 1) ? 40.0 : 56.0;
                pos.y = (vId == 0 || vId == 3) ? 139.0 : 155.0;
                pos.z = 0.0;
                vertexColor = vec4(1.0);
            }
            // #01FE00: Candy Score Digits at (X: 71px, Y: 147px)
            else {
                pos.x = originX + 71.0;
                pos.y = originY + 147.0;
                pos.z = 0.0;
                vertexColor.rgb = vec3(1.0);
            }
        }
    }

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);
}