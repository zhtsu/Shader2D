shader_type canvas_item;
render_mode unshaded;

uniform float brightness : hint_range(1.0, 1.4) = 1.0;

void fragment() {
	float uvy = 0.95 + 0.05 * cos(3.14 * (UV.y + 0.008 * TIME) * 240.0 * 1.0);
	float scanline = clamp(uvy, 0.0, 1.0);
	float uvx = 1.5 * cos(3.14 * UV.x * 640.0 * 1.0);
    float grille = 0.85 + 0.15 * clamp(uvx, 0.0, 1.0);   

	vec4 output_color = COLOR * scanline * grille * brightness;
	
    COLOR = output_color;
}
