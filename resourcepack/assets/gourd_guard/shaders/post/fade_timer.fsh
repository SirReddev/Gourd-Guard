#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D TimerInSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 prev = texture(TimerInSampler, vec2(0.5, 0.5));

    // prev.r: progress [0.0 -> 1.0]
    // prev.a: 1.0 if active, 0.0 if uninitialized
    if (prev.a < 0.5) {
        // Frame 0: initialize progress
        fragColor = vec4(0.005, 0.0, 0.0, 1.0);
    } else {
        float progress = prev.r;
        if (progress < 1.0) {
            // Advance progress (~100 frames total at 60fps = ~1.6s, smoothly distributed)
            progress = min(progress + 0.01, 1.0);
        }
        fragColor = vec4(progress, 0.0, 0.0, 1.0);
    }
}
