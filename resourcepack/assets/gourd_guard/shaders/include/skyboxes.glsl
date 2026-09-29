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
// 2. TWILIGHT PRINCESS NIGHT SKY (ID = 2)
// Exact match to The Legend of Zelda: Twilight Princess / Ocarina 3D Night Sky
// ==========================================

// Domain-warped natural lunar fractal noise (creates authentic organic crater seas)
float tf_lunarNoise(vec2 p) {
    vec2 q = vec2(tf_fbm(p + vec2(0.0, 0.0)), tf_fbm(p + vec2(5.2, 1.3)));
    vec2 r = vec2(tf_fbm(p + 3.0 * q + vec2(1.7, 9.2)), tf_fbm(p + 3.0 * q + vec2(8.3, 2.8)));
    return tf_fbm(p + 2.5 * r);
}

// Soft Scattered Fantasy Stars (Warm Golden & Diamond White)
vec3 tf_tpStars(vec2 uv, float t) {
    vec2 gridUv = fract(uv) - 0.5;
    vec2 id = floor(uv);
    
    vec2 randPos = (tf_hash22(id + 43.19) - 0.5) * 0.82;
    float dist = length(gridUv - randPos);
    
    float brightness = tf_hash12(id + 88.71);
    if (brightness < 0.35) return vec3(0.0);
    
    float twinkle = sin(t * 2.0 + brightness * 6.283) * 0.25 + 0.75;
    
    // Soft glowing fairy star (round glowing bokeh dot)
    float core = smoothstep(0.035, 0.0, dist) * 2.0;
    float halo = smoothstep(0.110, 0.0, dist) * 0.5;
    float star = (core + halo) * brightness * twinkle;
    
    vec3 starCol = mix(vec3(1.0, 0.92, 0.72), vec3(0.88, 0.95, 1.0), fract(brightness * 13.1));
    return star * starCol * 0.85;
}

// Authentic Glowing Full Moon with Organic Lunar Texture & Subtle Spectral Halos
vec3 tf_tpMoon(vec3 d, vec3 baseSky) {
    // Moon positioned high in the night sky (upper right viewing angle)
    vec3 moonDir = normalize(vec3(0.22, 0.65, -0.72));
    float cosAngle = dot(d, moonDir);
    float angle = acos(clamp(cosAngle, -1.0, 1.0));
    
    float moonRadius = 0.105;
    
    // 1. Concentric Atmospheric Lunar Halos (Outside disk)
    float haloDist = max(0.0, angle - moonRadius);
    // Smooth golden inner bloom
    float innerBloom = exp(-pow(haloDist / 0.035, 1.6)) * 0.65;
    
    // Subtle chromatic / spectral diffraction rings (as seen in Twilight Princess)
    float ringR = exp(-pow((angle - moonRadius * 1.65) / 0.040, 2.0)) * 0.16;
    float ringG = exp(-pow((angle - moonRadius * 1.85) / 0.040, 2.0)) * 0.18;
    float ringB = exp(-pow((angle - moonRadius * 2.05) / 0.045, 2.0)) * 0.24;
    vec3 spectralRing = vec3(ringR * 1.0, ringG * 0.95, ringB * 1.1);
    
    // Outer atmospheric ambient glow
    float wideGlow = exp(-pow(angle / 0.50, 1.6)) * 0.18;
    vec3 wideCol = vec3(0.12, 0.16, 0.35) * wideGlow;
    
    vec3 bloomCol = vec3(0.96, 0.90, 0.65) * innerBloom;
    vec3 atmosphericHalos = bloomCol + spectralRing + wideCol;
    
    vec3 result = baseSky + atmosphericHalos;
    
    // 2. Lunar Surface Disk with Organic Lunar Seas & Craters
    if (angle < moonRadius * 1.05) {
        vec3 up = vec3(0.0, 1.0, 0.0);
        vec3 right = normalize(cross(up, moonDir));
        vec3 mUp = cross(moonDir, right);
        
        vec2 mUv = vec2(dot(d, right), dot(d, mUp)) / moonRadius;
        float r = length(mUv);
        
        if (r <= 1.0) {
            float z = sqrt(1.0 - r * r);
            
            // Continuous natural fractal lunar surface (Sea of Tranquility, Ocean of Storms)
            float lunar1 = tf_lunarNoise(mUv * 2.8 + vec2(1.2, 3.4));
            float lunar2 = tf_fbm(mUv * 6.5 + vec2(4.1, 7.8));
            float lunar3 = tf_fbm(mUv * 14.0 + vec2(8.5, 2.3));
            float surfaceDetail = lunar1 * 0.60 + lunar2 * 0.28 + lunar3 * 0.12;
            
            // Tycho impact crater & subtle southern rays
            vec2 tychoPos = vec2(0.15, -0.48);
            vec2 toTycho = mUv - tychoPos;
            float tychoDist = length(toTycho);
            float tychoRays = pow(sin(atan(toTycho.y, toTycho.x) * 12.0 + lunar2 * 2.0) * 0.5 + 0.5, 3.0);
            tychoRays *= smoothstep(0.65, 0.08, tychoDist) * 0.20;
            float tychoPeak = smoothstep(0.05, 0.0, tychoDist) * 0.30;
            
            // Colors matching Twilight Princess:
            // Luminous golden-cream highlands + olive-tan / golden-gray lunar seas
            vec3 highlands = vec3(0.98, 0.96, 0.84) + vec3(tychoRays + tychoPeak);
            vec3 mareBasin = vec3(0.68, 0.64, 0.46);
            vec3 darkBasin = vec3(0.52, 0.48, 0.34);
            
            float mariaMask = smoothstep(0.32, 0.68, surfaceDetail);
            vec3 surfaceCol = mix(highlands, mareBasin, mariaMask);
            surfaceCol = mix(surfaceCol, darkBasin, smoothstep(0.55, 0.85, surfaceDetail) * 0.4);
            
            // 3D spherical limb darkening
            float limb = pow(z, 0.14);
            surfaceCol *= limb;
            
            // Crisp anti-aliased circular disk boundary
            float diskMask = smoothstep(1.0, 0.985, r);
            
            // Replace sky directly with moon surface (avoids blowing out)
            result = mix(result, surfaceCol, diskMask);
        }
    }
    
    float horizon = smoothstep(-0.06, 0.12, d.y);
    return mix(baseSky, result, horizon);
}

// Soft Layered Twilight Princess Clouds (Horizontal painterly midnight bands)
vec3 tf_tpClouds(vec3 d, float t) {
    if (d.y <= -0.10) return vec3(0.0);
    
    float planar = 1.0 / max(d.y + 0.16, 0.05);
    vec2 p = vec2(d.x * 0.75, d.z) * planar * 1.15;
    
    vec2 wind = vec2(t * 0.005, t * 0.001);
    
    // Horizontal cloud bands
    float n1 = tf_fbm(vec2(p.x * 0.55 + wind.x, p.y * 1.10 + wind.y));
    float n2 = tf_fbm(vec2(p.x * 1.25 - wind.x * 0.5, p.y * 2.10 + wind.y * 0.5));
    float cloudNoise = n1 * 0.65 + n2 * 0.35;
    
    float cloudDensity = smoothstep(0.36, 0.68, cloudNoise);
    
    // Twilight Princess palette: deep midnight indigo & soft twilight purple
    vec3 cloudShadow = vec3(0.025, 0.035, 0.095);
    vec3 cloudHighlight = vec3(0.065, 0.060, 0.150);
    vec3 cloudColor = mix(cloudShadow, cloudHighlight, smoothstep(0.42, 0.70, cloudNoise));
    
    float horizon = smoothstep(-0.08, 0.20, d.y);
    return cloudColor * cloudDensity * horizon * 0.75;
}

vec3 tf_halloweenSky(vec3 d) {
    float t = GameTime * 2.0 * PI;
    
    // 1. Rich Twilight Royal Blue Sky Gradient (Exact match to Zelda / Hyrule Night Sky)
    vec3 zenithColor   = vec3(0.035, 0.050, 0.160); // Deep Royal Midnight Sapphire
    vec3 midSkyColor   = vec3(0.060, 0.080, 0.240); // Rich Royal Twilight Blue
    vec3 horizonColor  = vec3(0.085, 0.080, 0.220); // Deep Indigo Horizon
    
    float y = clamp(d.y, 0.0, 1.0);
    vec3 sky = mix(horizonColor, midSkyColor, smoothstep(0.0, 0.40, y));
    sky = mix(sky, zenithColor, smoothstep(0.40, 1.0, y));
    
    // 2. Soft Scattered Fantasy Starfield
    vec2 uv = (d.xz / (0.65 + 0.35 * max(d.y, -0.35))) * 13.0;
    vec2 starUv = tf_rotate(uv + vec2(1.2, -3.1), t * 0.005);
    vec3 stars = tf_tpStars(starUv, t) * smoothstep(-0.05, 0.18, d.y);
    sky += stars * 0.85;
    
    // 3. Soft Painterly Twilight Princess Clouds
    sky += tf_tpClouds(d, t);
    
    // 4. Ultra High-Definition Glowing Full Moon with Spectral Halos
    sky = tf_tpMoon(d, sky);
    
    // 5. Ground Horizon Fog Blend
    sky = mix(vec3(0.020, 0.020, 0.050), sky, smoothstep(-0.35, 0.05, d.y));
    
    return sky;
}

#endif // GOURD_GUARD_SKYBOXES_GLSL
