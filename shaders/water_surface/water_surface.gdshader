shader_type canvas_item;
render_mode unshaded;

uniform float intensity = 20;
uniform float offset : hint_range(0.0, 1.0) = 0.05;

void fragment() {
	vec2 uv = UV;
	
	uv.x += sin(uv.y * intensity + TIME) * offset;
	
	COLOR = texture(TEXTURE, uv);
}
