#ifndef GOURD_GUARD_SKYBOXES_GLSL
#define GOURD_GUARD_SKYBOXES_GLSL

#include <minecraft:globals.glsl>


#ifndef PI
#define PI 3.14159265359
#endif

#ifndef TAU
#define TAU 6.28318530718
#endif

// ==========================================
// SHARED SHADER NOISE & UTILITIES
// ==========================================
float tf_hash12(vec2 p) {
    p = fract(p * vec2(443.897, 441.423));
    p += dot(p, p.yx + 19.19);
    return fract(p.x * p.y);
}

vec2 tf_hash22(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * vec3(443.897, 441.423, 437.195));
    p3 += dot(p3, p3.yzx + 19.19);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float tf_noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(
        mix(tf_hash12(i), tf_hash12(i + vec2(1.0, 0.0)), f.x),
        mix(tf_hash12(i + vec2(0.0, 1.0)), tf_hash12(i + vec2(1.0, 1.0)), f.x),
        f.y
    );
}

float tf_fbm(vec2 p) {
    float v = 0.0;
    float a = 0.5;
    mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.5));
    for (int i = 0; i < 5; i++) {
        v += a * tf_noise(p);
        p = rot * p * 2.0 + vec2(100.0);
        a *= 0.5;
    }
    return v;
}

vec2 tf_rotate(vec2 v, float a) {
    float s = sin(a), c = cos(a);
    return mat2(c, -s, s, c) * v;
}

// Crisp Twinkling Stars
vec3 tf_starField(vec2 uv, float t, float starScale) {
    vec2 gridUv = fract(uv) - 0.5;
    vec2 id = floor(uv);
    
    vec2 randPos = (tf_hash22(id) - 0.5) * 0.75;
    float dist = length(gridUv - randPos);
    
    float brightness = tf_hash12(id + 71.13);
    float twinkle = sin(t * 3.5 + brightness * 6.283) * 0.4 + 0.6;
    
    float star = smoothstep(0.065 * starScale, 0.0, dist) * brightness * twinkle;
    float spike = (smoothstep(0.02 * starScale, 0.0, abs(gridUv.x - randPos.x)) * smoothstep(0.18 * starScale, 0.0, abs(gridUv.y - randPos.y)) +
                   smoothstep(0.02 * starScale, 0.0, abs(gridUv.y - randPos.y)) * smoothstep(0.18 * starScale, 0.0, abs(gridUv.x - randPos.x))) * brightness * twinkle * 0.5;
    
    vec3 col = mix(vec3(0.9, 0.95, 1.0), vec3(1.0, 0.8, 0.6), fract(brightness * 13.7));
    return (star + spike) * col;
}

// Needle Shooting Stars & Flaming Comets
vec3 tf_fallingStars(vec3 d, float gt, int theme) {
    vec3 totalStars = vec3(0.0);
    
    for (int k = 0; k < 6; k++) {
        float fk = float(k);
        float period = 1.6 + mod(fk * 0.40, 1.1);
        float duration = 0.12 + mod(fk * 0.015, 0.025);
        
        float progress = mod(gt * 1.35 + fk * 1.23, period);
        if (progress > duration) continue;
        
        float p = progress / duration;
        float life = sin(p * PI);
        
        float startAngle = fk * 1.047 + mod(fk * 1.8, 0.9);
        vec3 startDir = normalize(vec3(cos(startAngle) * 0.55, 0.88, sin(startAngle) * 0.55));
        vec3 endDir   = normalize(vec3(cos(startAngle + 1.30) * 1.40, -0.22, sin(startAngle + 1.30) * 1.40));
        
        vec3 headDir = normalize(mix(startDir, endDir, p));
        float tailLength = 0.55 + mod(fk * 0.08, 0.12);
        vec3 tailDir = normalize(mix(startDir, endDir, max(0.0, p - tailLength)));
        
        vec3 N = cross(tailDir, headDir);
        float nLen = length(N);
        if (nLen < 0.0001) continue;
        N /= nLen;
        
        vec3 T = cross(N, tailDir);
        float arcAngle = acos(clamp(dot(tailDir, headDir), -1.0, 1.0));
        if (arcAngle < 0.001) continue;
        
        float distToPlane = abs(dot(d, N));
        float alongX = dot(d, tailDir);
        float alongY = dot(d, T);
        float angle = atan(alongY, alongX);
        
        float clampedAngle = clamp(angle, 0.0, arcAngle);
        float distAlong = abs(angle - clampedAngle);
        float distToArc = sqrt(distToPlane * distToPlane + distAlong * distAlong);
        
        float alongTail = clamp(angle / arcAngle, 0.0, 1.0);
        
        float sizeScale = 0.80 + mod(fk * 0.16, 0.25);
        float coreWidth = (0.0008 + alongTail * 0.0014) * sizeScale;
        float coreBeam  = exp(-pow(distToArc / coreWidth, 2.0) * 4.0) * pow(alongTail, 1.2);
        
        float glowWidth = (0.0022 + alongTail * 0.0038) * sizeScale;
        float haloGlow  = exp(-pow(distToArc / glowWidth, 2.0) * 2.6) * pow(alongTail, 1.4);
        
        float distToHead = length(d - headDir);
        float headCore = smoothstep(0.0040 * sizeScale, 0.0, distToHead) * 3.0;
        float headHalo = smoothstep(0.0085 * sizeScale, 0.0, distToHead) * 0.8;
        
        vec3 primaryCol, secondaryCol;
        if (theme == 0) {
            // Cosmic Nebula spectrum (Gold, Icy Cyan, Diamond White)
            int colorType = int(mod(fk, 3.0));
            if (colorType == 0) { primaryCol = vec3(1.0, 0.86, 0.22); secondaryCol = vec3(1.0, 0.52, 0.08); }
            else if (colorType == 1) { primaryCol = vec3(0.40, 0.85, 1.0); secondaryCol = vec3(0.15, 0.45, 0.95); }
            else { primaryCol = vec3(0.96, 0.98, 1.0); secondaryCol = vec3(0.85, 0.90, 1.0); }
        } else {
            // Night Sky spectrum (Emerald Green, Glacial Cyan, Diamond White)
            int colorType = int(mod(fk, 3.0));
            if (colorType == 0) { primaryCol = vec3(0.18, 0.95, 0.48); secondaryCol = vec3(0.04, 0.58, 0.28); }
            else if (colorType == 1) { primaryCol = vec3(0.30, 0.85, 1.0); secondaryCol = vec3(0.08, 0.45, 0.92); }
            else { primaryCol = vec3(0.96, 0.98, 1.0); secondaryCol = vec3(0.82, 0.90, 1.0); }
        }
        
        vec3 whiteCore = vec3(1.0, 1.0, 1.0);
        vec3 trailCol  = mix(secondaryCol, primaryCol, smoothstep(0.1, 0.7, alongTail));
        trailCol       = mix(trailCol, whiteCore, smoothstep(0.7, 0.98, alongTail));
        
        vec3 headVisual  = whiteCore * headCore + primaryCol * headHalo;
        vec3 trailVisual = whiteCore * coreBeam * 3.2 + trailCol * haloGlow * 1.0;
        
        float horizonFade = smoothstep(-0.25, 0.08, d.y);
        totalStars += (headVisual + trailVisual) * life * horizonFade;
    }
    
    return totalStars;
}

// ==========================================
// 1. COSMIC NEBULA (ID = 1)
// ==========================================
#define TF_NEB_BASE_COLOR vec3(0.015, 0.010, 0.045)
#define TF_NEB_GI_COLOR   vec3(0.040, 0.020, 0.090)

vec3 tf_neb_aurora(vec3 d, float t) {
    if (d.y <= -0.15 || d.y >= 0.85) return vec3(0.0);
    
    float heightFade = smoothstep(-0.15, 0.06, d.y);
    float angle = atan(d.x, d.z);
    vec3 totalAurora = vec3(0.0);
    
    const float centers[6]      = float[6](-2.85, -2.15, -0.85, -0.30,  1.40,  2.25);
    const float widths[6]       = float[6]( 0.14,  0.18,  0.12,  0.16,  0.15,  0.19);
    const float heightScales[6] = float[6]( 1.25,  1.40,  1.18,  1.32,  1.20,  1.45);
    
    for (int i = 0; i < 6; i++) {
        float fi = float(i);
        float speed = 0.40 + fi * 0.08;
        float sway = sin(t * 0.35 * speed + fi * 2.3) * 0.07;
        float c = centers[i] + sway;
        
        float diff = abs(angle - c);
        diff = min(diff, TAU - diff);
        
        float mask = exp(-pow(diff / widths[i], 2.0) * 4.0);
        if (mask < 0.005) continue;
        
        float topFade = pow(clamp(1.0 - d.y * heightScales[i], 0.0, 1.0), 1.4);
        float rayCoord = diff * (24.0 + fi * 2.0) + sin(d.y * 2.2 + t * 0.3) * 0.25;
        float rayDetail = tf_fbm(vec2(rayCoord, d.y * 2.2 - t * 0.45 * speed + fi * 1.8));
        rayDetail = pow(rayDetail * 0.5 + 0.5, 1.8) * 1.1;
        
        vec3 rayCol = mix(vec3(0.04, 0.55, 0.36), vec3(0.03, 0.40, 0.50), smoothstep(0.10, 0.55, d.y));
        float pulse = sin(t * (0.5 + fi * 0.12) + fi * 2.1) * 0.15 + 0.85;
        
        totalAurora += rayCol * mask * rayDetail * topFade * pulse * 0.88;
    }
    
    return totalAurora * heightFade;
}

vec3 tf_nebulaSky(vec3 d) {
    float t = GameTime * 2.0 * PI;
    float gt = GameTime * 20.0;
    float skyIntensity = smoothstep(-0.45, 0.05, d.y);
    
    vec2 uv = (d.xz / (0.65 + 0.35 * max(d.y, -0.35))) * 11.0;
    vec2 starUv = tf_rotate(uv + vec2(1.0, -4.0), t * 0.015);

    vec3 color = mix(TF_NEB_BASE_COLOR, TF_NEB_GI_COLOR, 0.4);
    color += tf_starField(starUv, t, 1.1) * skyIntensity;
    color += tf_neb_aurora(d, t);
    color += tf_fallingStars(d, gt, 0);

    return mix(TF_NEB_BASE_COLOR, color, skyIntensity);
}

// ==========================================
// 2. GOTHIC FANTASY NIGHT SKY (ID = 2)
// Exact match to Twilight Princess / Gothic RPG Night Sky
// ==========================================

// Soft Glowing Fantasy Stars (Warm Golden, Amber & Ice White)
vec3 tf_gothicStars(vec2 uv, float t) {
    vec2 gridUv = fract(uv) - 0.5;
    vec2 id = floor(uv);
    
    vec2 randPos = (tf_hash22(id + 31.7) - 0.5) * 0.8;
    float dist = length(gridUv - randPos);
    
    float brightness = tf_hash12(id + 67.4);
    if (brightness < 0.35) return vec3(0.0);
    
    float twinkle = sin(t * 2.2 + brightness * 6.283) * 0.25 + 0.75;
    
    // Smooth soft circular luminous dot
    float core = smoothstep(0.038, 0.0, dist) * 2.2;
    float halo = smoothstep(0.120, 0.0, dist) * 0.6;
    float star = (core + halo) * brightness * twinkle;
    
    // Warm golden star vs cold diamond star
    vec3 starCol = mix(vec3(1.0, 0.88, 0.60), vec3(0.90, 0.96, 1.0), fract(brightness * 11.7));
    return star * starCol;
}

// Photorealistic Majestic Full Moon with Detailed Maria & Concentric Ring Halo
vec3 tf_gothicMoon(vec3 d) {
    // Moon positioned high in the night sky (facing towards the open viewing angle)
    vec3 moonDir = normalize(vec3(0.18, 0.68, -0.70));
    float cosAngle = dot(d, moonDir);
    float angle = acos(clamp(cosAngle, -1.0, 1.0));
    
    float moonRadius = 0.105; // Large, majestic full moon disc
    vec3 totalMoon = vec3(0.0);
    
    // Concentric Atmospheric Lunar Halos (Exact match to Reference #2)
    // 1. Immediate golden bloom right around the moon
    float innerBloom = exp(-pow(angle / 0.14, 2.2)) * 0.85;
    // 2. Outer soft atmospheric ring glow
    float ringGlow   = exp(-pow((angle - 0.21) / 0.050, 2.0)) * 0.28;
    // 3. Wide subtle ambient moonlight scattering
    float wideGlow   = exp(-pow(angle / 0.55, 1.5)) * 0.35;
    
    vec3 bloomCol = vec3(1.0, 0.95, 0.72) * innerBloom;
    vec3 ringCol  = vec3(0.25, 0.30, 0.55) * ringGlow;
    vec3 wideCol  = vec3(0.15, 0.18, 0.38) * wideGlow;
    totalMoon += (bloomCol + ringCol + wideCol);
    
    // Moon Disk with High-Fidelity Craters & Surface Shading
    if (angle < moonRadius * 1.3) {
        vec3 up = vec3(0.0, 1.0, 0.0);
        vec3 right = normalize(cross(up, moonDir));
        vec3 mUp = cross(moonDir, right);
        
        vec2 mUv = vec2(dot(d, right), dot(d, mUp)) / moonRadius;
        float r = length(mUv);
        
        if (r <= 1.0) {
            float z = sqrt(1.0 - r * r);
            
            // Realistic lunar surface noise (Ocean of Storms, Sea of Tranquility)
            float mareLarge = tf_fbm(mUv * 3.5 + vec2(1.2, 2.8));
            float mareMed   = tf_fbm(mUv * 7.0 + vec2(4.5, 1.7));
            float mareFine  = tf_fbm(mUv * 14.0 + vec2(8.1, 5.3));
            float mare = mareLarge * 0.55 + mareMed * 0.30 + mareFine * 0.15;
            
            // Tycho impact crater rays (bright radial streaks from southern crater)
            vec2 tychoPos = vec2(0.15, -0.45);
            vec2 toTycho = mUv - tychoPos;
            float tychoDist = length(toTycho);
            float tychoAngle = atan(toTycho.y, toTycho.x);
            float rays = pow(sin(tychoAngle * 12.0 + tf_fbm(mUv * 6.0) * 2.0) * 0.5 + 0.5, 3.0);
            rays *= smoothstep(0.7, 0.05, tychoDist) * 0.35;
            
            // Base Colors matching Reference Image #2:
            // Luminous golden-cream highlands + olive-tan/golden-gray mare basins
            vec3 highlands = vec3(1.0, 0.98, 0.86) + rays;
            vec3 mareBasin = vec3(0.72, 0.68, 0.44); // Olive-gold crater shading
            
            float mariaMask = smoothstep(0.36, 0.68, mare);
            vec3 surfaceCol = mix(highlands, mareBasin, mariaMask * 0.65);
            
            // 3D spherical shading with bright center and soft limb
            float limb = pow(z, 0.22);
            float diskAntialias = smoothstep(1.0, 0.95, r);
            
            totalMoon += surfaceCol * limb * diskAntialias * 3.2;
        }
    }
    
    float horizon = smoothstep(-0.06, 0.14, d.y);
    return totalMoon * horizon;
}

// Painterly Gothic Clouds (Rich Indigo, Magenta-Purple & Moonlight Lit Edges)
vec3 tf_gothicClouds(vec3 d, float t) {
    if (d.y <= -0.10) return vec3(0.0);
    
    float planarDist = 1.0 / max(d.y + 0.18, 0.05);
    vec2 cloudPos = d.xz * planarDist * 1.35;
    
    vec2 wind1 = vec2(t * 0.006, t * 0.003);
    vec2 wind2 = vec2(-t * 0.004, t * 0.007);
    
    float fbm1 = tf_fbm(cloudPos * 0.65 + wind1);
    float fbm2 = tf_fbm(cloudPos * 1.30 + wind2);
    float cloudNoise = fbm1 * 0.68 + fbm2 * 0.32;
    
    float cloudMask = smoothstep(0.28, 0.72, cloudNoise);
    
    // Cloud Colors matching Reference Image #1:
    // Left side & shadows: Deep Midnight Indigo
    // Right side & highlights: Luminous Magenta / Plum Twilight
    vec3 cloudShadow  = vec3(0.035, 0.025, 0.075);
    vec3 cloudMagenta = vec3(0.22, 0.05, 0.16); // Rich glowing magenta-purple cloud bank
    
    // Asymmetrical warm glow across eastern sky (matches Image #1 right side)
    float eastGlow = smoothstep(-0.3, 0.8, d.x);
    vec3 cloudLit = mix(cloudShadow, cloudMagenta, eastGlow * smoothstep(0.35, 0.75, cloudNoise));
    
    float horizon = smoothstep(-0.08, 0.22, d.y);
    return cloudLit * cloudMask * horizon;
}

vec3 tf_halloweenSky(vec3 d) {
    float t = GameTime * 2.0 * PI;
    
    // 1. Rich Twilight Indigo & Deep Violet Sky Gradient (Exact match to Reference #1)
    vec3 zenithColor   = vec3(0.040, 0.045, 0.140); // Deep Royal Midnight Indigo
    vec3 midSkyColor   = vec3(0.065, 0.060, 0.190); // Twilight Sapphire Blue
    vec3 horizonColor  = vec3(0.110, 0.065, 0.180); // Moody Twilight Purple Horizon
    
    // Warm magenta-rose twilight sunset glow on the horizon edge (from Image #1)
    float horizonEast = smoothstep(-0.2, 0.9, d.x);
    horizonColor = mix(horizonColor, vec3(0.24, 0.06, 0.15), horizonEast * 0.65);
    
    float y = clamp(d.y, 0.0, 1.0);
    vec3 sky = mix(horizonColor, midSkyColor, smoothstep(0.0, 0.40, y));
    sky = mix(sky, zenithColor, smoothstep(0.40, 1.0, y));
    
    // 2. Soft Scattered Fantasy Starfield (Layers of warm & cool stars)
    vec2 uv = (d.xz / (0.65 + 0.35 * max(d.y, -0.35))) * 12.0;
    vec2 starUv = tf_rotate(uv + vec2(1.2, -3.1), t * 0.005);
    vec3 stars = tf_gothicStars(starUv, t) * smoothstep(-0.05, 0.18, d.y);
    sky += stars * 0.85;
    
    // 3. Glowing Majestic Full Moon with Concentric Halo
    sky += tf_gothicMoon(d);
    
    // 4. Soft Painterly Twilight Clouds
    sky += tf_gothicClouds(d, t);
    
    // 5. Horizon Fog Blend with Map Fog
    sky = mix(vec3(0.040, 0.030, 0.065), sky, smoothstep(-0.35, 0.05, d.y));
    
    return sky;
}

#endif // GOURD_GUARD_SKYBOXES_GLSL
