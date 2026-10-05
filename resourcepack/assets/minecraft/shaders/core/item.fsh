#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>
#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:oit.glsl>

#include <gourd_guard:skyboxes.glsl>

uniform sampler2D Sampler0;

#ifdef GLINT
uniform sampler2D GlintSampler;
#endif

#ifndef OIT_ALPHA_ONLY
layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;
#endif
layout(location = 2) in vec4 vertexColor;
#ifndef OIT_ALPHA_ONLY
layout(location = 3) in vec4 lightMapColor;
layout(location = 4) in vec4 overlayColor;
#endif
layout(location = 5) in vec2 texCoord0;
#ifdef GLINT
layout(location = 6) in vec2 texCoordGlint;
#endif

#ifndef OIT_ALPHA_ONLY
layout(location = 7) flat in int tf_skyId;
layout(location = 8) smooth in vec3 tf_pos;
layout(location = 9) smooth in vec4 tf_nearPos;
#endif

#ifndef OIT_ALPHA_ONLY
layout(location = 0) out vec4 fragColor;
#endif

#ifndef OIT_ALPHA_ONLY
vec4 calculateFinalColor(vec4 color) {
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
    color *= lightMapColor;

    #ifdef GLINT
    vec4 glintColor = GlintAlpha * texture(GlintSampler, texCoordGlint);
    color.rgb += glintColor.rgb * glintColor.rgb;
    #endif

    #ifdef OIT_ACCUMULATE
    color = sampleColorForAccumulation(color);
    vec4 fogColor = vec4(FogColor.rgb * color.a, FogColor.a);
    #else
    vec4 fogColor = FogColor;
    #endif

    return apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, fogColor);
}
#endif

void main() {
#ifndef OIT_ALPHA_ONLY
    // If this fragment belongs to a procedural skybox model
    if (tf_skyId > 0) {
        if (tf_skyId == 3) {
            // Flat Procedural Purple Portal directly on this surface
            float hCoord = (abs(dFdx(tf_pos.x)) + abs(dFdy(tf_pos.x)) > 0.0005) ? tf_pos.x : tf_pos.z;
            float vCoord = tf_pos.y;
            
            vec2 uv;
            if (abs(hCoord) <= 0.65 && abs(vCoord) <= 0.65) {
                // Centered unit plane (from [-8, -8] to [8, 8] -> [-0.5, 0.5])
                uv = vec2(hCoord, vCoord) * 2.0;
            } else {
                // Skybox box face (from [-16, -16] to [32, 32] -> center 0.5, span 1.5)
                uv = (vec2(hCoord, vCoord) - vec2(0.5)) / 1.5;
            }
            
            float gt = GameTime * 20.0;
            vec3 portal = tf_flatPurplePortal(uv, gt);
            fragColor = vec4(portal, 1.0);
            return;
        }

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
#endif

    vec4 color = texture(Sampler0, texCoord0);
    #ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
    #endif

    color *= vertexColor * ColorModulator;

    #ifdef GLINT
    color.a = max(color.a, GlintAlpha);
    #endif

    #ifdef OIT_ALPHA_ONLY
    executeAlphaOnlyPhase(gl_FragCoord.z, color.a);
    #else
    fragColor = calculateFinalColor(color);
    #endif
}