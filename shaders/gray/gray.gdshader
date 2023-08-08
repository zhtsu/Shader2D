shader_type canvas_item;
render_mode unshaded;

void fragment()
{
	// Weights
	float wr = 0.3;
	float wg = 0.59;
	float wb = 0.11;
	
	vec3 col = vec3(COLOR.r * wr + COLOR.g * wg + COLOR.b * wb);
	
	COLOR = vec4(col, COLOR.a);
}
