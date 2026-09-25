#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:light.glsl>
#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>
#include <minecraft:sample_lightmap.glsl>

layout(location = 0) in vec3 Position;
layout(location = 1) in vec4 Color;
layout(location = 2) in vec2 UV0;
layout(location = 3) in ivec2 UV1;
layout(location = 4) in ivec2 UV2;
#ifdef GLINT_SPECIAL
layout(location = 5) in vec2 UV3;
#endif
layout(location = 6) in vec3 Normal;

uniform sampler2D Sampler0;

#ifndef OIT_ALPHA_ONLY
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

layout(location = 0) out float sphericalVertexDistance;
layout(location = 1) out float cylindricalVertexDistance;
#endif
layout(location = 2) out vec4 vertexColor;
#ifndef OIT_ALPHA_ONLY
layout(location = 3) out vec4 lightMapColor;
layout(location = 4) out vec4 overlayColor;
#endif

layout(location = 5) out vec2 texCoord0;
#ifdef GLINT
layout(location = 6) out vec2 texCoordGlint;
#endif

#ifndef OIT_ALPHA_ONLY
layout(location = 7) flat out int tf_skyId;
layout(location = 8) smooth out vec3 tf_pos;
layout(location = 9) smooth out vec4 tf_nearPos;
#endif

// Checks for magic vertex tint color #0101FE (RGB: 1, 1, 254)
bool isEmissive(vec4 color) {
    return abs(color.r * 255.0 - 1.0) < 0.5 &&
           abs(color.g * 255.0 - 1.0) < 0.5 &&
           abs(color.b * 255.0 - 254.0) < 0.5;
}

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    #ifndef OIT_ALPHA_ONLY
    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    #endif

    if (isEmissive(Color)) {
        vertexColor = vec4(1.0);
    } else {
        vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
    }

    #ifndef OIT_ALPHA_ONLY
    lightMapColor = sample_lightmap(Sampler2, UV2);
    overlayColor = texelFetch(Sampler1, UV1, 0);
    #endif

    texCoord0 = UV0;
    #ifdef GLINT
    #ifdef GLINT_SPECIAL
    texCoordGlint = (TextureMat * vec4(UV3, 0.0, 1.0)).xy;
    #else
    texCoordGlint = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
    #endif
    #endif

    #ifndef OIT_ALPHA_ONLY
    // Detect TowerFall Skybox signature (G == 70, B == 83, R == Sky ID)
    ivec2 atlasSize = textureSize(Sampler0, 0);
    ivec2 tf_iuv = ivec2((UV0 - 1e-6) * atlasSize);
    ivec4 tf_col = ivec4(texelFetch(Sampler0, tf_iuv, 0) * 255.0);

    if (tf_col.g == 70 && tf_col.b == 83) {
        tf_skyId = tf_col.r;
        tf_pos = Position;
        tf_nearPos = inverse(ProjMat * ModelViewMat) * gl_Position.xyww;
    } else {
        tf_skyId = 0;
        tf_pos = vec3(0.0);
        tf_nearPos = vec4(0.0);
    }
    #endif
}