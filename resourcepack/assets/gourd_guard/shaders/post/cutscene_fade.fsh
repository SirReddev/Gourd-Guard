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

    if (timer.a < 0.5) {
        fragColor = scene;
        return;
    }

    int startTicks = int(round(timer.r * 255.0)) * 256 + int(round(timer.g * 255.0));
    int currentTicks = int(round(fract(GameTime) * 24000.0));

    int elapsedTicks = currentTicks - startTicks;
    if (elapsedTicks < 0) {
        elapsedTicks += 24000;
    }

    float t = float(elapsedTicks);

    // Fast cinematic cutscene transition (55 ticks ~ 2.75s total):
    // 0t -> 15t  (0.0s -> 0.75s): Smooth fade into black
    // 15t -> 40t (0.75s -> 2.0s): Solid black hold (allows teleport & camera setup)
    // 40t -> 55t (2.0s -> 2.75s): Smooth fade from black back to clear
    // >= 55t: Normal scene
    float blackness = 0.0;
    if (t < 15.0) {
        blackness = smoothstep(0.0, 15.0, t);
    } else if (t < 40.0) {
        blackness = 1.0;
    } else if (t < 55.0) {
        blackness = 1.0 - smoothstep(40.0, 55.0, t);
    } else {
        blackness = 0.0;
    }

    fragColor = vec4(scene.rgb * (1.0 - blackness), scene.a);
}
