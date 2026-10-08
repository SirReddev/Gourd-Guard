#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D InSampler;
uniform sampler2D TimerStateSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 scene = texture(InSampler, texCoord);
    vec4 timer = texture(TimerStateSampler, vec2(0.5, 0.5));

    // If timer is not yet initialized, show original scene
    if (timer.y < 0.5) {
        fragColor = scene;
        return;
    }

    float startTime = timer.x;
    float elapsed = GameTime - startTime;
    if (elapsed < 0.0) {
        elapsed += 1.0;
    }

    // Convert GameTime (1 full Minecraft day = 24000 ticks = 1200 seconds) to elapsed seconds
    float seconds = elapsed * 1200.0;

    // Smooth cinematic transition (3.0 seconds total):
    // 0.0s -> 1.0s: Smooth fade to black
    // 1.0s -> 2.0s: Hold full black (allows behind-the-scenes game reset)
    // 2.0s -> 3.0s: Smooth fade from black back to normal
    // >= 3.0s: Return 100% to normal scene
    float blackness = 0.0;
    if (seconds < 1.0) {
        blackness = smoothstep(0.0, 1.0, seconds);
    } else if (seconds < 2.0) {
        blackness = 1.0;
    } else if (seconds < 3.0) {
        blackness = 1.0 - smoothstep(2.0, 3.0, seconds);
    } else {
        blackness = 0.0;
    }

    fragColor = vec4(scene.rgb * (1.0 - blackness), scene.a);
}
