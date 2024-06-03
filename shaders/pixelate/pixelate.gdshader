shader_type canvas_item;

uniform int pixel_count = 100;

void fragment() {
	vec2 uv = UV;
	uv *= float(pixel_count);
	uv = round(uv);
	uv /= float(pixel_count);
	
	COLOR = texture(TEXTURE, uv);
}
