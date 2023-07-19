shader_type canvas_item;
render_mode unshaded;

uniform vec2 scale = vec2(1.0, 1.0);
uniform bool open = true;
uniform float radius = 100.0;
uniform vec2 mouse_pos;

varying vec2 vertex_pos;

void vertex()
{
	vertex_pos = VERTEX.xy * scale;
}

void fragment()
{
	float alpha = 1.0;
	float brightness = 0.0;
	
	if (open)
	{
		float dis = distance(vertex_pos, mouse_pos);
		brightness = 1.0 - (dis / radius);

	}
	
	COLOR = vec4(COLOR.rgb * brightness, alpha);
}
