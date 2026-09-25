#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>
#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>

#include <gourd_guard:skyboxes.glsl>

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;
layout(location = 2) in vec4 vertexColor;
layout(location = 3) in vec4 lightMapColor;
layout(location = 4) in vec4 overlayColor;
layout(location = 5) in vec2 texCoord0;

layout(location = 6) flat in int tf_skyId;
layout(location = 7) smooth in vec3 tf_pos;
layout(location = 8) smooth in vec4 tf_nearPos;

layout(location = 0) out vec4 fragColor;


void main() {
    // If this fragment belongs to a procedural skybox model
    if (tf_skyId > 0) {
        vec3 nearPos = tf_nearPos.xyz / tf_nearPos.w;
        vec3 boxMin = vec3(-1.05);
        vec3 boxMax = vec3(2.05);
        bool isCameraInside = all(greaterThanEqual(nearPos, boxMin)) && all(lessThanEqual(nearPos, boxMax));

        if (!isCameraInside) {
            discard;
        }

        vec3 dir = normalize(tf_pos - nearPos);
        vec3 sky = vec3(0.0);

        if (tf_skyId == 1) sky = tf_nebulaSky(dir);
        else if (tf_skyId == 2) sky = tf_halloweenSky(dir);

        fragColor = vec4(sky, 1.0);
        return;
    }

    vec4 color = texture(Sampler0, texCoord0);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

    color *= vertexColor * ColorModulator;
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
    color *= lightMapColor;

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}