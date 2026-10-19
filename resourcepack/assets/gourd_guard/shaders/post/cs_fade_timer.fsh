#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D TimerInSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 prev = texture(TimerInSampler, vec2(0.5, 0.5));
    int currentTicks = int(round(fract(GameTime) * 24000.0));

    // prev.a: 1.0 = initialized, 0.0 = uninitialized
    if (prev.a < 0.5) {
        // First frame: record current game tick accurately using 16-bit split across R and G channels
        float r = float(currentTicks / 256) / 255.0;
        float g = float(currentTicks % 256) / 255.0;
        fragColor = vec4(r, g, 0.0, 1.0);
    } else {
        // Check elapsed ticks
        int startTicks = int(round(prev.r * 255.0)) * 256 + int(round(prev.g * 255.0));
        int elapsedTicks = currentTicks - startTicks;
        if (elapsedTicks < 0) elapsedTicks += 24000;

        // Once 60 ticks pass, reset to 0.0 so subsequent cutscene fades trigger fresh
        if (elapsedTicks >= 60) {
            fragColor = vec4(0.0, 0.0, 0.0, 0.0);
        } else {
            fragColor = prev;
        }
    }
}
