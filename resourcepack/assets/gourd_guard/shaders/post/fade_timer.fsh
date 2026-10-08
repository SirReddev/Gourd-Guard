#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D TimerInSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 state = texture(TimerInSampler, vec2(0.5, 0.5));
    // state.x: startTime recorded at initial frame
    // state.y: initialization flag (1.0 = initialized, 0.0 = uninitialized)
    if (state.y < 0.5) {
        fragColor = vec4(GameTime, 1.0, 0.0, 1.0);
    } else {
        fragColor = state;
    }
}
