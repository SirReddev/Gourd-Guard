#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec2 oneTexel = 1.0 / InSize;
    vec4 center = texture(InSampler, texCoord);

    float maxDiff = 0.0;
    vec3 colorAccum = vec3(0.0);
    float colorWeight = 0.0;

    const int NUM_DIRS = 12;
    const float PI2 = 6.28318530718;

    // Crisp, balanced outline sampling (1.0px and 2.0px)
    float radii[2] = float[2](1.0, 2.0);

    for (int r = 0; r < 2; r++) {
        float rad = radii[r];
        for (int d = 0; d < NUM_DIRS; d++) {
            float angle = float(d) * (PI2 / float(NUM_DIRS));
            vec2 offset = vec2(cos(angle), sin(angle)) * oneTexel * rad;
            vec4 neighbor = texture(InSampler, texCoord + offset);
            
            float diff = abs(center.a - neighbor.a);
            // Attenuate interior edge difference so the glow outlines the model rather than consuming it
            if (center.a > 0.1) {
                diff *= 0.25;
            }
            if (diff > maxDiff) {
                maxDiff = diff;
            }
            if (neighbor.a > 0.01) {
                colorAccum += neighbor.rgb * neighbor.a;
                colorWeight += neighbor.a;
            }
        }
    }

    if (center.a > 0.01) {
        colorAccum += center.rgb * center.a * 3.0;
        colorWeight += center.a * 3.0;
    }

    float total = clamp(maxDiff * 1.25, 0.0, 1.0);
    vec3 outColor = colorWeight > 0.0 ? (colorAccum / colorWeight) : vec3(0.0);

    fragColor = vec4(outColor, total);
}