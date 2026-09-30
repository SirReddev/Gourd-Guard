layout(std140) uniform Fog {
    vec4 FogColor;
    float FogEnvironmentalStart;
    float FogEnvironmentalEnd;
    float FogRenderDistanceStart;
    float FogRenderDistanceEnd;
    float FogSkyEnd;
    float FogCloudsEnd;
};

float linear_fog_value(float vertexDistance, float fogStart, float fogEnd) {
    if (vertexDistance <= fogStart) {
        return 0.0;
    } else if (vertexDistance >= fogEnd) {
        return 1.0;
    }

    return (vertexDistance - fogStart) / (fogEnd - fogStart);
}

float total_fog_value(float sphericalVertexDistance, float cylindricalVertexDistance, float environmentalStart, float environmantalEnd, float renderDistanceStart, float renderDistanceEnd) {
    return max(linear_fog_value(sphericalVertexDistance, environmentalStart, environmantalEnd), linear_fog_value(cylindricalVertexDistance, renderDistanceStart, renderDistanceEnd));
}

vec4 apply_fog(vec4 inColor, float sphericalVertexDistance, float cylindricalVertexDistance, float environmentalStart, float environmantalEnd, float renderDistanceStart, float renderDistanceEnd, vec4 fogColor) {
    // If rendering GUI, Inventory, HUD, or 2D models, bypass fog completely
    if (renderDistanceStart > 500.0 || environmentalStart > 500.0 || fogColor.a <= 0.0) {
        return inColor;
    }

    // Expanded clear visibility bubble around player, smoothly fading into deep midnight fog
    float clearRadius = 20.0;  // 0% fog within 20 blocks of the player
    float blackWall   = 45.0;  // Smoothly fades into deep dark fog by 45 blocks

    float activeStart = min(renderDistanceStart, clearRadius);
    float activeEnd   = min(renderDistanceEnd, blackWall);

    float fogValue = total_fog_value(sphericalVertexDistance, cylindricalVertexDistance, environmentalStart, environmantalEnd, activeStart, activeEnd);
    fogValue = pow(fogValue, 1.15); // Smooth natural falloff curve

    vec3 blackFog = vec3(0.006, 0.004, 0.018); // Deep eerie midnight purple-black void

    return vec4(mix(inColor.rgb, blackFog, fogValue * fogColor.a), inColor.a);
}

float fog_spherical_distance(vec3 pos) {
    return length(pos);
}

float fog_cylindrical_distance(vec3 pos) {
    float distXZ = length(pos.xz);
    float distY = abs(pos.y);
    return max(distXZ, distY);
}