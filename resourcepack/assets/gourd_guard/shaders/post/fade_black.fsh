#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;
uniform sampler2D TimerStateSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 scene = texture(InSampler, texCoord);
    vec4 timer = texture(TimerStateSampler, vec2(0.5, 0.5));

    // If timer is not initialized yet, display standard scene
    if (timer.a < 0.5) {
        fragColor = scene;
        return;
    }

    float p = timer.r;

    // Smooth cinematic curve:
    // 0.00 -> 0.35: Smooth fade into black
    // 0.35 -> 0.65: Full solid black hold (allows reset & cleanup)
    // 0.65 -> 1.00: Smooth fade from black back to normal
    // >= 1.00: Stays 100% normal scene
    float blackness = 0.0;
    if (p > 0.0 && p < 0.35) {
        blackness = smoothstep(0.0, 0.35, p);
    } else if (p >= 0.35 && p < 0.65) {
        blackness = 1.0;
    } else if (p >= 0.65 && p < 1.0) {
        blackness = 1.0 - smoothstep(0.65, 1.0, p);
    } else {
        blackness = 0.0;
    }

    fragColor = vec4(scene.rgb * (1.0 - blackness), scene.a);
}
