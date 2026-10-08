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

    // Exact requested timing (20 ticks = 1.0 second):
    // 0t -> 40t   (0.0s -> 2.0s) : Smooth 2s fade into solid black
    // 40t -> 200t (2.0s -> 10.0s): Full 8s solid black hold (allows title display & game reset)
    // 200t -> 240t(10.0s -> 12.0s): Smooth 2s fade from black back to normal
    // >= 240t: 100% normal scene
    float blackness = 0.0;
    if (t < 40.0) {
        blackness = smoothstep(0.0, 40.0, t);
    } else if (t < 200.0) {
        blackness = 1.0;
    } else if (t < 240.0) {
        blackness = 1.0 - smoothstep(200.0, 240.0, t);
    } else {
        blackness = 0.0;
    }

    fragColor = vec4(scene.rgb * (1.0 - blackness), scene.a);
}
