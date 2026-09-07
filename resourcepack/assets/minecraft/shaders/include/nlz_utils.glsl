#define RED_VEC4 vec4(1.0, 0.0, 0.0, 1.0)
#define GREEN_VEC4 vec4(0.0, 1.0, 0.0, 1.0)
#define BLUE_VEC4 vec4(0.0, 0.0, 1.0, 1.0)
#define YELLOW_VEC4 vec4(1.0, 1.0, 0.0, 1.0)
#define CYAN_VEC4 vec4(0.0, 1.0, 1.0, 1.0)
#define MAGENTA_VEC4 vec4(1.0, 0.0, 1.0, 1.0)
#define WHITE_VEC4 vec4(1.0, 1.0, 1.0, 1.0)
#define BLACK_VEC4 vec4(0.0, 0.0, 0.0, 1.0)
#define GRAY_VEC4 vec4(0.5, 0.5, 0.5, 1.0)

#define DEBUG_FRAG(color) fragColor = color;
#define PI 3.14159265359
#define TAU 6.28318530718

float rand(float n){return fract(sin(n) * 43758.5453123);}
float rand(vec2 n) { 
	return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

vec2 rand2(float n) {
    return vec2(rand(n), rand(n + 123.45));
}

float tchebychev(vec2 uv) {
    return max(abs(uv.x), abs(uv.y));
}

vec2 rotate(vec2 v, float a) {
    float s = sin(a);
    float c = cos(a);
    return mat2(c, -s, s, c) * v;
}

bool closeRGB(ivec3 a, ivec3 b, int epsilon){
    for(int i = 0; i < 3; i++){
        if(abs(a[i] - b[i]) > epsilon){
            return false;
        }
    }
    return true;
}

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}




vec3 rand3(float n) {
    return vec3(
        rand(n),
        rand(n + 1.),
        rand(n + 2.)
    );
}