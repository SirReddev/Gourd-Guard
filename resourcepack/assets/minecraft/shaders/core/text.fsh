#version 330
#extension GL_ARB_separate_shader_objects : require

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#include <minecraft:fog.glsl>
#endif

#include <minecraft:dynamictransforms.glsl>
#include <minecraft:globals.glsl>

uniform sampler2D Sampler0;

#include <minecraft:portrait.glsl>

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;
layout(location = 2) in vec4 vertexColor;
layout(location = 3) in vec2 texCoord0;
layout(location = 4) in vec2 vignetteCoord;
layout(location = 5) in float custom;
#else
layout(location = 0) in vec4 vertexColor;
layout(location = 1) in vec2 texCoord0;
layout(location = 2) in vec2 vignetteCoord;
layout(location = 3) in float custom;
#endif

layout(location = 0) out vec4 fragColor;


void main() {
    ivec4 c = ivec4(round(vertexColor * 255.0));
    bool isVignette = (custom > 1.5 || (c.r == 251 && c.g == 251 && c.b == 250));

    if (isVignette) {
        vec2 uv = vignetteCoord;
        vec2 centered = uv - vec2(0.5);

        // Elliptical radial distance
        float dist = length(centered * vec2(1.2, 1.0));

        // Radial vignette falloff
        float radial = smoothstep(0.20, 0.75, dist) * 0.65;

        // Subtle base dimming across the screen
        float baseDim = 0.15;

        // Bottom gradient darkening behind dialogue area
        float bottomShadow = smoothstep(0.5, 1.0, uv.y) * 0.20;

        float alpha = clamp(baseDim + radial + bottomShadow, 0.0, 0.85);
        fragColor = vec4(0.0, 0.0, 0.0, alpha * ColorModulator.a);
        return;
    }

    if (custom > 0.5) {
        fragColor = portraitRender(texCoord0, 68./70., GameTime);
        if (fragColor.a < 0.1) discard;
        fragColor.a = vertexColor.a;
        return;
    }


#ifdef IS_GRAYSCALE
    vec4 texColor = texture(Sampler0, texCoord0).rrrr;
#else
    vec4 texColor = texture(Sampler0, texCoord0);
#endif

#ifdef IS_SEE_THROUGH
    vec4 color = texColor * vertexColor;
#else
    vec4 color = texColor * vertexColor * ColorModulator;
#endif
    if (color.a < 0.1) {
        discard;
    }

#ifdef IS_SEE_THROUGH
    fragColor = color * ColorModulator;
#elif defined(IS_GUI)
    fragColor = color;
#else
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
#endif
}