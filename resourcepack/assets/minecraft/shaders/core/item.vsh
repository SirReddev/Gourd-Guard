#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:light.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec4 lightMapColor;
out vec4 overlayColor;
out vec2 texCoord0;

flat out int tf_skyId;
smooth out vec3 tf_pos;
smooth out vec4 tf_nearPos;

// Checks for magic vertex tint color #0101FE (RGB: 1, 1, 254)
bool isEmissive(vec4 color) {
    return abs(color.r * 255.0 - 1.0) < 0.5 &&
           abs(color.g * 255.0 - 1.0) < 0.5 &&
           abs(color.b * 255.0 - 254.0) < 0.5;
}

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);

    if (isEmissive(Color)) {
        // Bypass directional shading and reset tint to pure white
        vertexColor = vec4(1.0);
    } else {
        vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
    }

    lightMapColor = sample_lightmap(Sampler2, UV2);
    overlayColor = texelFetch(Sampler1, UV1, 0);

    texCoord0 = UV0;

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
}