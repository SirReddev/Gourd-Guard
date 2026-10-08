#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D TimerInSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 prev = texture(TimerInSampler, vec2(0.5, 0.5));

    // prev.a: 1.0 = initialized, 0.0 = uninitialized
    if (prev.a < 0.5) {
        // First frame: record current game tick accurately using 16-bit split across R and G channels
        int currentTicks = int(round(clamp(GameTime, 0.0, 1.0) * 24000.0));
        float r = float(currentTicks / 256) / 255.0;
        float g = float(currentTicks % 256) / 255.0;
        fragColor = vec4(r, g, 0.0, 1.0);
    } else {
        // Retain initial start tick
        fragColor = prev;
    }
}
