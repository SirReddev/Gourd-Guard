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
const uint tf_userMoonData[1024] = uint[1024](
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000004u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00100000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000040u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x05000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15500000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55500000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55500000u, 0x00000140u, 0x00000000u, 
    0x00000000u, 0x00100000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15400000u, 0x00000140u, 0x00000000u, 
    0x00000000u, 0x00040000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x05400000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00054000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00015000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00015500u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000004u, 0x00000000u, 
    0x00000000u, 0x00005540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x00000155u, 0x00000000u, 
    0x00000000u, 0x00000550u, 0x00000000u, 0x00000000u, 0x00000000u, 0x60000000u, 0x00001555u, 0x00000000u, 
    0x00000000u, 0x00000154u, 0x00000000u, 0x00000000u, 0x00000000u, 0x54000000u, 0x00015555u, 0x00000000u, 
    0x00000000u, 0x00000154u, 0x00000000u, 0x00000000u, 0x00000000u, 0x54000000u, 0x00055555u, 0x00000000u, 
    0x00000000u, 0x00000155u, 0x00000000u, 0x00000000u, 0x00000000u, 0x54000000u, 0x00155555u, 0x00000000u, 
    0x40000000u, 0x00001555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x54000000u, 0x00555555u, 0x00000000u, 
    0x40000000u, 0x00005555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x50000000u, 0x05555555u, 0x00000000u, 
    0x50000000u, 0x00005555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x15555555u, 0x00000000u, 
    0x50000000u, 0x00005555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55555555u, 0x00000000u, 
    0x54000000u, 0x00005555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555555u, 0x00000000u, 
    0x54000000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555554u, 0x00000000u, 
    0x55000000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555554u, 0x00000000u, 
    0x55000000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555550u, 0x00000000u, 
    0x55000000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x00000000u, 
    0x55400000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555000u, 0x00000000u, 
    0x55400000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55554000u, 0x00000001u, 
    0x55400000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55540000u, 0x00000001u, 
    0x55500000u, 0x00015555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55500000u, 0x00000005u, 
    0x55500000u, 0x00005555u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55400000u, 0x00000005u, 
    0x15500000u, 0x00001540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x54000000u, 0x00000001u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x15000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x55500000u, 0x00000001u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x55540000u, 0x00001501u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000500u, 
    0x55550000u, 0x00001501u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000500u, 
    0x55550000u, 0x00001505u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000500u, 
    0x55554000u, 0x00000001u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000500u, 
    0x55554000u, 0x00000001u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x55554000u, 0x00000001u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x55554000u, 0x50000000u, 0x00000001u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000040u, 0x01540000u, 
    0x15550000u, 0x54000000u, 0x00000001u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000040u, 0x05550000u, 
    0x05550000u, 0x54000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15550000u, 
    0x00100001u, 0x10000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15550000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15550000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000100u, 0x15550000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000554u, 0x55550000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x50001555u, 0x55550001u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x54005555u, 0x55554015u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55015555u, 0x55555015u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55015555u, 0x55555055u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55055555u, 0x55555055u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55455555u, 0x55555155u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55055555u, 0x55A55055u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55415555u, 0x16A95055u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55405555u, 0x16AA5155u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55501554u, 0x16AA5155u, 
    0x00000010u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0xA5540540u, 0x16AA5155u, 
    0x00000010u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0xA9550000u, 0x16AA5156u, 
    0x00000010u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0xAA550000u, 0x16AA515Au, 
    0x00000010u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0xAA550000u, 0x06AA9156u, 
    0x00000010u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55554000u, 0x46AA8155u, 
    0x00000050u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555400u, 0x06AA8155u, 
    0x00000150u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00100000u, 0x00000000u, 0x55555500u, 0x01AA4155u, 
    0x01540550u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x01554555u, 
    0x01540550u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x00054555u, 
    0x01500550u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x00000555u, 
    0x00500550u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x00000555u, 
    0x00000540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x00050555u, 
    0x00001540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55555500u, 0x00055555u, 
    0x00155540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00140000u, 0x55555500u, 0x00155555u, 
    0x05555540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x05540000u, 0x55555500u, 0x00155555u, 
    0x15555540u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15540000u, 0x55555500u, 0x00155555u, 
    0x15555500u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55540000u, 0x55555500u, 0x00055555u, 
    0x15555500u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55540000u, 0x55555500u, 0x00055555u, 
    0x05555400u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55500000u, 0x55555400u, 0x00015555u, 
    0x01555400u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x55500000u, 0x55555400u, 0x00015555u, 
    0x01555400u, 0x55000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x15500000u, 0x55555014u, 0x00015555u, 
    0x01555000u, 0x55540000u, 0x00000005u, 0x00000000u, 0x00000000u, 0x15400000u, 0x55554000u, 0x00005555u, 
    0x05555000u, 0x55555400u, 0x00000055u, 0x00000050u, 0x00000000u, 0x00000000u, 0x55554005u, 0x00005555u, 
    0x05554000u, 0x55555540u, 0x00001555u, 0x00000150u, 0x00000000u, 0x40000000u, 0x55554015u, 0x00001555u, 
    0x05554000u, 0x55555550u, 0x00155555u, 0x00000154u, 0x00000000u, 0x40000040u, 0x55554015u, 0x00001555u, 
    0x05550000u, 0x59555550u, 0x00555555u, 0x50000150u, 0x00000005u, 0x50040050u, 0x55554015u, 0x00010555u, 
    0x00150000u, 0xAAA95540u, 0x05555556u, 0x55400040u, 0x00000055u, 0x54140154u, 0x55554005u, 0x00000555u, 
    0x00140000u, 0xAAA95550u, 0x1555556Au, 0x55500000u, 0x00000555u, 0x54000155u, 0x55555005u, 0x00000155u, 
    0x00540000u, 0xAAAA9550u, 0x555AAAAAu, 0x55500000u, 0x00055555u, 0x54000154u, 0x55555005u, 0x00000055u, 
    0x00500000u, 0xAAAA9550u, 0x55AAAAAAu, 0x55554000u, 0x05555555u, 0x54000150u, 0x55555400u, 0x00000015u, 
    0x01400000u, 0xAAAA9550u, 0x55AAAAAAu, 0xA5555000u, 0x1555556Au, 0x00000100u, 0x55555500u, 0x00000005u, 
    0x05400000u, 0xAAAA9554u, 0x55AAAAAAu, 0xAA555400u, 0x555AAAAAu, 0x00000000u, 0x55555540u, 0x00000001u, 
    0x14000000u, 0xAAAA9554u, 0x556AAAAAu, 0xAAA55400u, 0x556AAAAAu, 0x00000155u, 0x55555554u, 0x00000001u, 
    0x54000000u, 0xAAAA9555u, 0x156AAAAAu, 0xAAAA5500u, 0x556AAAAAu, 0x55541555u, 0x55555555u, 0x00000001u, 
    0x50000000u, 0xAAAA5555u, 0x056AAAAAu, 0xAAAA5500u, 0x556AAAAAu, 0x55555555u, 0x55555555u, 0x00000010u, 
    0x10000000u, 0xAAA95555u, 0x015AAAAAu, 0xAAAA9500u, 0x556AAAAAu, 0x55555555u, 0x15555555u, 0x00000000u, 
    0x00000000u, 0xAAA55555u, 0x015AAAAAu, 0xAAAA9500u, 0x556AAAAAu, 0x55555555u, 0x05555555u, 0x00000000u, 
    0x00000000u, 0xAA955554u, 0x016AAAAAu, 0xAAAA9500u, 0x555AAAAAu, 0x556A9555u, 0x00555555u, 0x00000000u, 
    0x00000000u, 0xAA555550u, 0x056AAAAAu, 0xAAAA9500u, 0x555AAAAAu, 0x56AA9555u, 0x00055555u, 0x00000000u, 
    0x00000000u, 0xA9555540u, 0x05AAAAAAu, 0xAAAAA540u, 0x5556AAAAu, 0x56AAA555u, 0x00005555u, 0x00000000u, 
    0x00000000u, 0xA9555500u, 0x15AAAAAAu, 0xAAAAA540u, 0x5555AAAAu, 0x56AAA555u, 0x00040555u, 0x00000000u, 
    0x00000000u, 0xA5555400u, 0x15AAAAAAu, 0xAAAAA540u, 0x55556AAAu, 0x55AAA555u, 0x00154015u, 0x00000000u, 
    0x00000000u, 0x95555000u, 0x15AAAAAAu, 0xAAAAA540u, 0x55555AAAu, 0x555A9555u, 0x00154001u, 0x00000000u, 
    0x00000000u, 0x55554000u, 0x156AAAAAu, 0xAAAA9550u, 0x555556AAu, 0x15555555u, 0x00004000u, 0x00000000u, 
    0x00000000u, 0x55550000u, 0x0556AAA9u, 0xAAA95540u, 0x555556AAu, 0x01555555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x55500000u, 0x0155AA95u, 0xA5555540u, 0x555556AAu, 0x40000015u, 0x00000005u, 0x00000000u, 
    0x00000000u, 0x55400000u, 0x00555555u, 0x55555500u, 0x555556AAu, 0x40000000u, 0x00000001u, 0x00000000u, 
    0x00000000u, 0x55000000u, 0x00555555u, 0x55400000u, 0x055555A9u, 0x40000540u, 0x00000001u, 0x00000000u, 
    0x00000000u, 0x50000000u, 0x01555555u, 0x55000000u, 0x40555555u, 0x00155555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x05555555u, 0x54001410u, 0x54015555u, 0x00155555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x55555540u, 0x54005555u, 0x55005555u, 0x00155555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x55550000u, 0x50015555u, 0x55400555u, 0x00055555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x55000000u, 0x50015555u, 0x55400555u, 0x00015555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x40005400u, 0x55500155u, 0x00005555u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x40000000u, 0x55400055u, 0x00004055u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x50000055u, 0x00000001u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u, 
    0x00000000u, 0x00000000u, 0x00000000u, 0x00004000u, 0x00010000u, 0x00000000u, 0x00000000u, 0x00000000u
);


// Fetch raw 2-bit crater intensity from compressed 128x128 moon data at integer grid coords (x, y) [0..127]
int tf_fetchMoonPixel(int x, int y) {
    x = clamp(x, 0, 127);
    y = clamp(y, 0, 127);
    int p = y * 128 + x;
    int uintIdx = p >> 4;
    int bitShift = (p & 15) * 2;
    return int((tf_userMoonData[uintIdx] >> bitShift) & 3u);
}

// Bilinear filtered sampling of the user's moon crater texture (returns continuous [0..2])
float tf_sampleUserMoon(vec2 uv) {
    vec2 pos = clamp(uv, 0.0, 1.0) * 127.0;
    vec2 f = fract(pos);
    f = f * f * (3.0 - 2.0 * f); // smooth cubic hermite interpolation
    int x0 = int(floor(pos.x));
    int y0 = int(floor(pos.y));
    int x1 = min(x0 + 1, 127);
    int y1 = min(y0 + 1, 127);
    
    float p00 = float(tf_fetchMoonPixel(x0, y0));
    float p10 = float(tf_fetchMoonPixel(x1, y0));
    float p01 = float(tf_fetchMoonPixel(x0, y1));
    float p11 = float(tf_fetchMoonPixel(x1, y1));
    
    return mix(mix(p00, p10, f.x), mix(p01, p11, f.x), f.y);
}

// Authentic Glowing Full Moon with User's Exact Texture & Soft Controlled Halo
vec3 tf_tpMoon(vec3 d, vec3 baseSky) {
    // Moon positioned high in the night sky (upper right viewing angle)
    vec3 moonDir = normalize(vec3(0.22, 0.65, -0.72));
    float cosAngle = dot(d, moonDir);
    float angle = acos(clamp(cosAngle, -1.0, 1.0));
    
    float moonRadius = 0.110;
    
    // 1. Soft, Dim Atmospheric Halos (Soft ambient glow, not blindingly bright)
    float haloDist = max(0.0, angle - moonRadius);
    float innerBloom = exp(-pow(haloDist / 0.032, 1.6)) * 0.30;
    float wideGlow   = exp(-pow(angle / 0.38, 1.5)) * 0.08;
    
    vec3 bloomCol = mix(vec3(0.85, 0.88, 0.98), vec3(0.95, 0.92, 0.85), 0.30) * innerBloom;
    vec3 wideCol  = vec3(0.030, 0.025, 0.110) * wideGlow;
    vec3 atmosphericHalos = bloomCol + wideCol;
    
    vec3 result = baseSky + atmosphericHalos;
    
    // 2. Lunar Surface Disk with Exact User Cutout Shapes (Controlled Soft Luminance)
    if (angle < moonRadius * 1.05) {
        vec3 up = vec3(0.0, 1.0, 0.0);
        vec3 right = normalize(cross(up, moonDir));
        vec3 mUp = cross(moonDir, right);
        
        vec2 mUv = vec2(dot(d, right), dot(d, mUp)) / moonRadius;
        float r = length(mUv);
        
        if (r <= 1.0) {
            float z = sqrt(1.0 - r * r);
            
            // Map mUv [-1, 1] to user texture UV [0, 1]
            vec2 texUv = vec2(mUv.x * 0.5 + 0.5, 0.5 - mUv.y * 0.5);
            float craterVal = tf_sampleUserMoon(texUv);
            
            // Exact colors from user cutout with balanced, non-blinding luminance
            vec3 moonBody    = vec3(0.880, 0.880, 0.920);
            vec3 lightCrater = vec3(0.700, 0.680, 0.820);
            vec3 darkCrater  = vec3(0.580, 0.550, 0.720);
            
            vec3 surfaceCol = moonBody;
            if (craterVal > 0.05) {
                float t1 = smoothstep(0.10, 0.90, craterVal);
                surfaceCol = mix(moonBody, lightCrater, t1);
                float t2 = smoothstep(1.05, 1.85, craterVal);
                surfaceCol = mix(surfaceCol, darkCrater, t2);
            }
            
            // Subtle 3D spherical curvature
            float limb = pow(z, 0.08);
            surfaceCol *= mix(0.90, 1.0, limb);
            
            // Crisp anti-aliased circular disk boundary
            float diskMask = smoothstep(1.0, 0.988, r);
            
            // Replace sky cleanly with moon surface
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
    
    // Deep midnight purple-blue clouds
    vec3 cloudShadow = vec3(0.010, 0.008, 0.032);
    vec3 cloudHighlight = vec3(0.030, 0.022, 0.075);
    vec3 cloudColor = mix(cloudShadow, cloudHighlight, smoothstep(0.42, 0.70, cloudNoise));
    
    float horizon = smoothstep(-0.08, 0.20, d.y);
    return cloudColor * cloudDensity * horizon * 0.75;
}

// Fast & Sleek Fire & Cosmic Blue Comets Razing Through the Sky
vec3 tf_halloweenComets(vec3 d, float gt) {
    vec3 totalComets = vec3(0.0);
    
    for (int k = 0; k < 6; k++) {
        float fk = float(k);
        // Fast periodic intervals and quick ~0.8-1.0s flight time
        float period   = 1.7 + mod(fk * 0.40, 1.1);
        float duration = 0.10 + mod(fk * 0.015, 0.025);
        
        float progress = mod(gt * 1.40 + fk * 1.25, period);
        if (progress > duration) continue;
        
        float p = progress / duration;
        float life = sin(p * PI);
        
        // Diverse sweeping trajectory angles across the upper sky dome
        float startAngle = fk * 1.047 + mod(fk * 2.1, 1.4);
        vec3 startDir = normalize(vec3(cos(startAngle) * 0.65, 0.88, sin(startAngle) * 0.65));
        vec3 endDir   = normalize(vec3(cos(startAngle + 1.40) * 1.45, -0.18, sin(startAngle + 1.40) * 1.45));
        
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
        
        // Sleek, smaller comet scale
        float sizeScale = 0.75 + mod(fk * 0.15, 0.25);
        
        // Flaming comet trail beam & plasma halo
        float coreWidth = (0.0009 + alongTail * 0.0018) * sizeScale;
        float coreBeam  = exp(-pow(distToArc / coreWidth, 2.0) * 4.0) * pow(alongTail, 1.2);
        
        float glowWidth = (0.0028 + alongTail * 0.0055) * sizeScale;
        float haloGlow  = exp(-pow(distToArc / glowWidth, 2.0) * 2.5) * pow(alongTail, 1.4);
        
        // Crisp blazing head
        float distToHead = length(d - headDir);
        float headCore = smoothstep(0.0045 * sizeScale, 0.0, distToHead) * 3.5;
        float headFlare = smoothstep(0.0100 * sizeScale, 0.0, distToHead) * 1.2;
        
        // Alternate between Blazing Fire Comets and Cosmic Blue Comets
        bool isFire = (int(mod(fk, 2.0)) == 0);
        
        vec3 whiteCore = vec3(1.0, 1.0, 1.0);
        vec3 primaryCol, secondaryCol;
        
        if (isFire) {
            // Blazing Fire Comet (Sun Gold / Flame Orange / Crimson)
            primaryCol   = vec3(1.00, 0.55, 0.08); // Molten orange-gold
            secondaryCol = vec3(0.95, 0.20, 0.02); // Deep fiery red
        } else {
            // Cosmic Blue Comet (Electric Cyan / Sapphire / Royal Cobalt)
            primaryCol   = vec3(0.28, 0.85, 1.00); // Radiant cyan
            secondaryCol = vec3(0.10, 0.35, 0.95); // Royal cobalt blue
        }
        
        vec3 trailCol = mix(secondaryCol, primaryCol, smoothstep(0.1, 0.7, alongTail));
        trailCol      = mix(trailCol, whiteCore, smoothstep(0.70, 0.98, alongTail));
        
        vec3 headVisual  = whiteCore * headCore + primaryCol * headFlare;
        vec3 trailVisual = whiteCore * coreBeam * 3.2 + trailCol * haloGlow * 1.2;
        
        float horizonFade = smoothstep(-0.20, 0.10, d.y);
        totalComets += (headVisual + trailVisual) * life * horizonFade;
    }
    
    return totalComets;
}

vec3 tf_halloweenSky(vec3 d) {
    float t = GameTime * 2.0 * PI;
    float gt = GameTime * 20.0;
    
    // 1. Way Darker Spooky Purple-Blue Sky Gradient
    vec3 zenithColor   = vec3(0.012, 0.010, 0.052); // Very Deep Dark Midnight Violet-Blue
    vec3 midSkyColor   = vec3(0.024, 0.020, 0.095); // Deep Dark Spooky Purple-Blue
    vec3 horizonColor  = vec3(0.040, 0.028, 0.125); // Dark Twilight Indigo-Purple Horizon
    
    float y = clamp(d.y, 0.0, 1.0);
    vec3 sky = mix(horizonColor, midSkyColor, smoothstep(0.0, 0.40, y));
    sky = mix(sky, zenithColor, smoothstep(0.40, 1.0, y));
    
    // 2. Crisp Twinkling Spiked Starfield (Exact match to Nebula shader)
    vec2 uv = (d.xz / (0.65 + 0.35 * max(d.y, -0.35))) * 11.5;
    vec2 starUv = tf_rotate(uv + vec2(1.0, -4.0), t * 0.015);
    vec3 stars = tf_starField(starUv, t, 1.05) * smoothstep(-0.05, 0.18, d.y);
    sky += stars;
    
    // 3. Soft Painterly Twilight Clouds
    sky += tf_tpClouds(d, t);
    
    // 4. Large Blazing Fire & Blue Comets Razing Across the Sky
    sky += tf_halloweenComets(d, gt);
    
    // 5. Glowing Moon with User Cutout Texture (Controlled Soft Luminance)
    sky = tf_tpMoon(d, sky);
    
    // 6. Dark Horizon Fog Blend
    sky = mix(vec3(0.008, 0.006, 0.020), sky, smoothstep(-0.35, 0.05, d.y));
    
    return sky;
}

#endif // GOURD_GUARD_SKYBOXES_GLSL
