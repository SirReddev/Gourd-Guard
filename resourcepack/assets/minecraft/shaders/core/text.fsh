#version 330

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#moj_import <minecraft:fog.glsl>
#endif

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

uniform sampler2D Sampler0;

#moj_import <minecraft:portrait.glsl>

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
in float sphericalVertexDistance;
in float cylindricalVertexDistance;
#endif

in vec4 vertexColor;
in vec2 texCoord0;
in vec2 vignetteCoord;
in float custom;

out vec4 fragColor;

void main() {
    if (custom > 0.5) {
        fragColor = portraitRender(texCoord0, 68./70., GameTime);
        if (fragColor.a < 0.1) discard;
        fragColor.a = vertexColor.a;
        return;
    }

    ivec4 c = ivec4(round(vertexColor * 255.0));
    bool isVignette = (c.r == 251 && c.g == 251 && c.b == 250);

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