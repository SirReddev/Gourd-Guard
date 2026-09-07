#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

#moj_import <gourd_guard:skyboxes.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec4 lightMapColor;
in vec4 overlayColor;
in vec2 texCoord0;

flat in int tf_skyId;
smooth in vec3 tf_pos;
smooth in vec4 tf_nearPos;

out vec4 fragColor;

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