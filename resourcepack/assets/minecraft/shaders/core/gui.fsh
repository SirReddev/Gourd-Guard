#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>

#define WIDTH 422
#define HEIGHT 237

#include <image/canvas1.glsl>


layout(location = 0) in vec4 vertexColor;
layout(location = 1) in vec3 pos;

layout(location = 0) out vec4 fragColor;

ivec2 imageSize = ivec2(WIDTH, HEIGHT);

// Scale factor: 0.70 (Crisp centered artwork)
const float IMG_SCALE = 0.70;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) discard;

    vec2 RealSSize = vec2(2.0 / ProjMat[0][0], abs(2.0 / ProjMat[1][1]));
    ivec3 c = ivec3(round(color.rgb * 255.0));

    // Loading overlay background -> Two-stage cinematic layered fade
    if (c == ivec3(239, 50, 61)) {
        vec2 pixelUnit = RealSSize.xy / vec2(WIDTH, HEIGHT);
        vec2 center = RealSSize * 0.5;
        
        vec2 scaledPos = (pos.xy - center) / IMG_SCALE + center;
        ivec2 RealPixelPos = ivec2(floor(scaledPos / pixelUnit));
        
        vec3 rawLogo = vec3(0.0);
        
        if (RealPixelPos.x >= 0 && RealPixelPos.x < WIDTH && RealPixelPos.y >= 0 && RealPixelPos.y < HEIGHT) {
            vec3 logoCol = pColor(RealPixelPos, imageSize);
            rawLogo = logoCol / 255.0;
        }
        
        float rawAlpha = color.a * ColorModulator.a;
        
        // Stage 1 (0.0 -> 0.5): Black background fades in/out
        float bgAlpha = smoothstep(0.0, 0.45, rawAlpha);
        
        // Stage 2 (0.5 -> 1.0): Logo fades in over black, and fades out first
        float logoAlpha = smoothstep(0.45, 1.0, rawAlpha);
        
        // Blend logo over solid black background
        vec3 finalRgb = mix(vec3(0.0), rawLogo, logoAlpha);
        
        fragColor = vec4(finalRgb, bgAlpha);
        return;
    }

    // All other GUI elements (including loading progress bar and in-game inventory) render normally
    fragColor = color * ColorModulator;
}