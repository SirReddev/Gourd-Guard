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
    // prev.b: stores the last frame's tick scaled: (currentTicks / 100) (range 0..240)
    int lastTick100 = int(round(prev.b * 255.0));
    int currentTick100 = currentTicks / 100;
    int tickDiff = abs(currentTick100 - lastTick100);
    if (tickDiff > 120) {
        tickDiff = 240 - tickDiff; // handle 24000 tick day wrap
    }

    // If uninitialized (prev.a < 0.5) OR if shader was inactive for > 200 ticks (> 10s):
    if (prev.a < 0.5 || tickDiff > 2) {
        // Record fresh start tick across R and G channels, and current tick in B
        float r = float(currentTicks / 256) / 255.0;
        float g = float(currentTicks % 256) / 255.0;
        float b = float(currentTick100) / 255.0;
        fragColor = vec4(r, g, b, 1.0);
    } else {
        // Active rendering of consecutive frames: retain start tick, update last seen tick in B
        float b = float(currentTick100) / 255.0;
        fragColor = vec4(prev.r, prev.g, b, 1.0);
    }
}
