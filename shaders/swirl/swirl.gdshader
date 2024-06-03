shader_type canvas_item;

uniform float twirl = 1;
uniform float speed : hint_range(0.0, 1.0) = 0.1;

void fragment() {
	vec2 uv = UV - 0.5;
	float a = atan(uv.y, uv.x);
	float d = length(uv);
	a += (0.5 - d) * twirl + TIME * speed;
	uv.x = cos(a) * d;
	uv.y = sin(a) * d;
	uv += 0.5;
	
	COLOR = texture(TEXTURE, uv);
}
