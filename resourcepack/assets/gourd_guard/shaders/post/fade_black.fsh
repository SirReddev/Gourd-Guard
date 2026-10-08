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

    // If timer is not initialized yet, display standard scene
    if (timer.a < 0.5) {
        fragColor = scene;
        return;
    }

    // Decode start tick from R and G channels
    int startTicks = int(round(timer.r * 255.0)) * 256 + int(round(timer.g * 255.0));
    int currentTicks = int(round(clamp(GameTime, 0.0, 1.0) * 24000.0));

    int elapsedTicks = currentTicks - startTicks;
    if (elapsedTicks < 0) {
        elapsedTicks += 24000;
    }

    float t = float(elapsedTicks);

    // Smooth cinematic curve tied to game ticks (20 ticks = 1.0 second):
    // 0t -> 30t   (0.0s -> 1.5s): Smooth fade into pure black behind title
    // 30t -> 90t  (1.5s -> 4.5s): Solid black hold (title stays shining above, map/base resets)
    // 90t -> 120t (4.5s -> 6.0s): Smooth fade from black back to normal world
    // >= 120t: Screen is 100% normal
    float blackness = 0.0;
    if (t < 30.0) {
        blackness = smoothstep(0.0, 30.0, t);
    } else if (t < 90.0) {
        blackness = 1.0;
    } else if (t < 120.0) {
        blackness = 1.0 - smoothstep(90.0, 120.0, t);
    } else {
        blackness = 0.0;
    }

    fragColor = vec4(scene.rgb * (1.0 - blackness), scene.a);
}
