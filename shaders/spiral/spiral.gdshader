shader_type canvas_item;
render_mode unshaded;

uniform vec4 line_color : source_color = vec4(1.0);
uniform float line_width : hint_range(0.0, 1.0) = 0.2;
uniform float line_distance : hint_range(0.0, 1.0) = 0.5;
uniform float line_blur : hint_range(0.01, 1.0) = 0.1;

void fragment()
{
	vec2 uv = UV;
	uv -= 0.5; 
	
	float angle = atan(uv.y, uv.x);
	float len = length(uv);
	float offset = len + (angle / (PI * 2.0)) * line_distance;
	float circles = mod(offset - TIME, line_distance);
	float s1 = smoothstep(circles - line_blur, circles, line_width);
	float s2 = smoothstep(circles, circles + line_blur, line_width);
	vec3 color = (s1 - s2) * line_color.rgb;
	
	COLOR = vec4(color, line_color.a);
}
