// Official JNNGL GUI Avatar Implementation (Mirrored & Flat)
// Source: https://github.com/JNNGL/vanilla-shaders/tree/main/gui_avatars

#define OUTLINE_COLOR (vec4(0.0, 0.0, 0.0, 1.0))

bool rect(ivec2 coord, int x1, int x2, int y1, int y2) {
    return coord.x >= x1 && coord.x < x2 && coord.y >= y1 && coord.y < y2;
}

vec4 renderHead(ivec2 pixelReset) {
    vec4 fragColor = vec4(0.0);
    ivec2 pixel = pixelReset;

    if (rect(pixel, 0, 16, 0, 18)) { // Overlay Front
        if (pixel.y > 1) pixel.y--;
        if (pixel.y > 15) pixel.y--;
        ivec2 coord = pixel / 2 + ivec2(40, 8);
        fragColor = texelFetch(Sampler0, coord, 0);
        pixel = pixelReset;
    } else if (rect(pixel, 16, 24, 0, 18)) { // Overlay Right
        pixel.x -= 16;
        if (pixel.y > 0) pixel.y--;
        if (pixel.y > 15) pixel.y--;
        ivec2 coord = pixel / ivec2(1, 2) + ivec2(48, 8);
        fragColor = texelFetch(Sampler0, coord, 0);
        pixel = pixelReset;
        fragColor.rgb *= 0.6;
    }

    if (fragColor.a < 1.0) {
        if (rect(pixel, 1, 16, 1, 17)) { // Front
            pixel--;
            if (pixel.x > 6) pixel.x++;
            ivec2 coord = pixel / 2 + 8;
            vec4 tex = texelFetch(Sampler0, coord, 0);
            if (tex.a > 0.1) {
                fragColor.rgb = mix(tex.rgb, fragColor.rgb, fragColor.a);
                fragColor.a = 1.0;
            }
        } else if (rect(pixel, 16, 24, 1, 17)) { // Side
            pixel--;
            ivec2 coord = (pixel - ivec2(15, 0)) / ivec2(1, 2) + ivec2(16, 8);
            vec4 tex = texelFetch(Sampler0, coord, 0);
            if (tex.a > 0.1) {
                fragColor.rgb = mix(tex.rgb * 0.6, fragColor.rgb, fragColor.a);
                fragColor.a = 1.0;
            }
        }
        pixel = pixelReset;
    }

    if (rect(pixel, 8, 23, 0, 1)) { // Overlay Back
        pixel.x -= 8;
        ivec2 coord = pixel / 2 + ivec2(56, 8);
        vec4 tex = texelFetch(Sampler0, coord, 0);
        if (tex.a > 0.0 && texelFetch(Sampler0, coord + ivec2(0, 1), 0).a > 0.1) {
            fragColor = tex;
        }
        pixel = pixelReset;
    }

    if (fragColor.a > 0.1 && fragColor.a < 1.0) {
        fragColor.rgb = mix(vec3(0.0), fragColor.rgb, fragColor.a);
        fragColor.a = 1.0;
    }

    return fragColor;
}

vec4 renderBody(ivec2 pixelReset) {
    vec4 fragColor = vec4(0.0);
    ivec2 pixel = pixelReset;

    if (rect(pixel, 3, 18, 17, 31)) { // Front
        pixel -= ivec2(3, 17);
        if (pixel.x > 6) pixel.x++;
        ivec2 coord = pixel / 2 + ivec2(20, 36); // Overlay
        fragColor = texelFetch(Sampler0, coord, 0);
        if (fragColor.a < 0.1) {
            ivec2 coord = pixel / 2 + 20; // Body
            fragColor = texelFetch(Sampler0, coord, 0);
        }
        pixel = pixelReset;
    }

    return fragColor;
}

vec4 renderArmRight(ivec2 pixelReset) {
    vec4 fragColor = vec4(0.0);
    ivec2 pixel = pixelReset;

    if (rect(pixel, 19, 25, 17, 31)) { // Front
        pixel -= ivec2(19, 17);
        ivec2 coord = pixel / 2 + ivec2(52, 52); // Overlay
        fragColor = texelFetch(Sampler0, coord, 0);
        if (fragColor.a < 0.1) {
            ivec2 coord = pixel / 2 + ivec2(36, 52); // Arm
            fragColor = texelFetch(Sampler0, coord, 0);
        }
        pixel = pixelReset;
    } else if (rect(pixel, 25, 28, 17, 31)) { // Side
        pixel -= ivec2(25, 17);
        if (pixel == ivec2(2, 0)) return vec4(0.0);
        ivec2 coord = pixel / ivec2(1, 2) + ivec2(56, 52); // Overlay
        fragColor = texelFetch(Sampler0, coord, 0);
        if (fragColor.a < 0.1) {
            ivec2 coord = pixel / ivec2(1, 2) + ivec2(40, 52); // Arm
            fragColor = texelFetch(Sampler0, coord, 0);
        }
        fragColor.rgb *= 0.6;
        pixel = pixelReset;
    }

    return fragColor;
}

vec4 renderArmLeft(ivec2 pixelReset) {
    vec4 fragColor = vec4(0.0);
    ivec2 pixel = pixelReset;

    if (rect(pixel, 0, 6, 17, 31)) {
        pixel -= ivec2(0, 17);
        ivec2 coord = pixel / 2 + ivec2(44, 36); // Overlay
        fragColor = texelFetch(Sampler0, coord, 0);
        if (fragColor.a < 0.1) {
            ivec2 coord = pixel / 2 + ivec2(44, 20); // Arm
            fragColor = texelFetch(Sampler0, coord, 0);
        }
        pixel = pixelReset;
    }

    return fragColor;
}

vec4 render(ivec2 pixelReset, float gameTime) {
    const ivec2 outlineOffsets[] = ivec2[](ivec2(-1, 1), ivec2(0, 1), ivec2(1, 1), ivec2(1, 0), ivec2(1, -1), ivec2(0, -1), ivec2(-1, -1), ivec2(-1, 0));

    // Smooth Idle Animation (Head moves subtly with 1px max travel, arms breathe vertically)
    // GameTime in Minecraft ranges from 0.0 to 1.0 over 24000 ticks.
    float t = gameTime * 24000.0 * 0.12; // ~2.6 seconds per smooth natural cycle
    int headY = (sin(t) > 0.40) ? 1 : 0;  // Subtle 1px lift only (no downward displacement)
    int armY  = int(round(sin(t + 0.55) * 0.85));

    vec4 fragColor = vec4(0.0);

    // 1. Right Arm (Vertical idle movement only)
    ivec2 armRPos = pixelReset - 1 - ivec2(3, armY);
    fragColor = renderArmRight(armRPos);
    if (fragColor.a < 0.1) {
        for (int i = 0; i < 8; i++) {
            if (renderArmRight(armRPos + outlineOffsets[i]).a >= 0.1) {
                fragColor = OUTLINE_COLOR;
                break;
            }
        }
    }

    // 2. Head (Gentle up & down idle bobbing)
    if (fragColor.a < 0.1) {
        ivec2 headPos = pixelReset - 1 - ivec2(3, headY);
        fragColor = renderHead(headPos);
        if (fragColor.a < 0.1) {
            for (int i = 0; i < 8; i++) {
                if (renderHead(headPos + outlineOffsets[i]).a >= 0.1) {
                    fragColor = OUTLINE_COLOR;
                    break;
                }
            }
        }
    }

    // 3. Body (Stable trunk)
    if (fragColor.a < 0.1) {
        fragColor = renderBody(pixelReset - 1 - ivec2(3, 0));
        if (fragColor.a < 0.1) {
            for (int i = 0; i < 8; i++) {
                if (renderBody(pixelReset - 1 - ivec2(3, 0) + outlineOffsets[i]).a >= 0.1) {
                    fragColor = OUTLINE_COLOR;
                    break;
                }
            }
        }
    }

    // 4. Left Arm (Gentle breathing lift)
    if (fragColor.a < 0.1) {
        ivec2 armLPos = pixelReset - 1 - ivec2(0, armY);
        fragColor = renderArmLeft(armLPos);
        if (fragColor.a < 0.1) {
            for (int i = 0; i < 8; i++) {
                if (renderArmLeft(armLPos + outlineOffsets[i]).a >= 0.1) {
                    fragColor = OUTLINE_COLOR;
                    break;
                }
            }
        }
    }

    return fragColor;
}

vec4 renderOutlined(ivec2 pixelReset, float gameTime) {
    vec4 fragColor = render(pixelReset - 1, gameTime);
    if (fragColor.a < 0.1) {
        const ivec2 outlineOffsets[] = ivec2[](ivec2(-1, 0), ivec2(1, 0), ivec2(0, 1));
        for (int i = 0; i < 3; i++) {
            if (render(pixelReset - 1 + outlineOffsets[i], gameTime).a >= 0.1) {
                fragColor = OUTLINE_COLOR;
                break;
            }
        }
    }

    return fragColor;
}

vec4 portraitRender(vec2 uv, float aspectRatio, float gameTime) {
    // Mirrored horizontally: flip X
    vec2 mirroredUv = vec2(1.0 - uv.x, uv.y);
    ivec2 pixelReset = ivec2(round(mirroredUv * 30.0 - 0.5));
    vec4 fragColor = renderOutlined(pixelReset, gameTime);
    return fragColor;
}