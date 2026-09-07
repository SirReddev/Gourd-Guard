#version 330

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

layout(std140) uniform BlurConfig {
    vec2 BlurDir;
    float Radius;
};

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec2 oneTexel = 1.0 / InSize;
    vec2 sampleStep = oneTexel * BlurDir;

    vec4 blurred = vec4(0.0);
    float totalWeight = 0.0;
    float radius = 3.5; // Balanced bloom radius

    for (float a = -radius; a <= radius; a += 1.0) {
        float weight = 1.0 - abs(a) / (radius + 1.0);
        blurred += texture(InSampler, texCoord + sampleStep * a) * weight;
        totalWeight += weight;
    }

    vec4 finalColor = blurred / totalWeight;
    fragColor = vec4(finalColor.rgb * 1.25, clamp(finalColor.a * 1.3, 0.0, 1.0));
}