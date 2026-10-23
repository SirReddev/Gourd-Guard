/*
 Generated from https://non0reo.github.io/ImgToShader/
*/

#version 150

#define WIDTH 338
#define HEIGHT 190

#moj_import <utils.glsl>
#moj_import <image/canvas1.glsl>

in vec4 vertexColor;
in vec3 pos;

uniform vec4 ColorModulator;
uniform mat4 ProjMat;
uniform vec2 ScreenSize;

out vec4 fragColor;

ivec2 imageSize = ivec2(WIDTH, HEIGHT);

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) discard;

    fragColor = color * ColorModulator;
    
    vec2 RealSSize = getScreenSize(ProjMat, ScreenSize);
    vec2 pixelUnit = RealSSize.xy / imageSize.xy;
    ivec2 RealPixelPos = getPixelPos(pixelUnit, pos.xy);

    
    if (color.r == 239.0 / 255.0) {
        vec3 newColor = pColor(RealPixelPos, imageSize) / 255;
	fragColor = vec4(newColor, color.a);
    }

}