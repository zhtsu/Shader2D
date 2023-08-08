shader_type canvas_item;
render_mode unshaded;

uniform vec3 color_1 : source_color = vec3(0.96, 0.57, 0.15);
uniform vec3 color_2 : source_color = vec3(1.0, 0.89, 0.41);
uniform float speed : hint_range(1.0, 10.0) = 6.0;

void fragment()
{
	vec2 uv = UV - 0.5;
	vec2 q = vec2(atan(uv.x, uv.y), length(uv));
	float f = smoothstep(-0.1, 0.1, sin(q.x * 10.0 + TIME * speed));
	COLOR = vec4(mix(color_1, color_2, f), 1.0);
}
