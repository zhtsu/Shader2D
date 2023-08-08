shader_type canvas_item;
render_mode unshaded;

uniform float line_width : hint_range(0.0, 1.0) = 0.2;
uniform float line_distance : hint_range(0.0, 1.0) = 0.5;

void fragment()
{
	vec2 uv = UV;
	uv -= 0.5; 
	
	float angle = atan(uv.y, uv.x);
	float len = length(uv);
	float offset = len + (angle / (PI * 2.0)) * line_distance;
	float circles = mod(offset - TIME, line_distance);
	
	vec3 col = (1.0 - circles) * COLOR.rgb;
	
	COLOR = vec4(col, COLOR.a);
}
