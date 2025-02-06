shader_type canvas_item;

uniform vec4 highlight_color = vec4(1.0, 1.0, 0.0, 1.0); // Highlight color
uniform float highlight_intensity : hint_range(0.0, 1.0) = 0.0; // Intensity of the highlight
uniform float glow_size : hint_range(0.0, 10.0) = 1.0; // Size of the glow effect around opaque pixels

void fragment() {
    vec4 base_color = texture(TEXTURE, UV); // Sample the base texture
    float alpha = base_color.a; // Get the alpha value of the texture

    // Create a glow effect using the alpha channel
    float glow = 0.0;
    if (glow_size > 0.0) {
        for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
                vec2 offset = vec2(float(x), float(y)) * glow_size / TEXTURE_PIXEL_SIZE;
                glow += texture(TEXTURE, UV + offset).a;
            }
        }
        glow /= 9.0; // Average the surrounding alpha values
    }

    float final_alpha = max(alpha, glow * highlight_intensity); // Combine base alpha and glow
    vec4 highlight_effect = highlight_color * highlight_intensity * final_alpha;

    COLOR = mix(base_color, highlight_effect, highlight_intensity); // Blend base color with the highlight
    COLOR.a = final_alpha; // Preserve transparency
}
