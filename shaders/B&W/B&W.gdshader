shader_type canvas_item;
render_mode unshaded;

uniform float threshold : hint_range(0.0, 1.0) = 0.3;

void fragment()
{
	if ((COLOR.r + COLOR.g + COLOR.b) / 3.0 < threshold)
	{
		COLOR = vec4(1.0, 1.0, 1.0, 1.0);
	}
	else
	{
		COLOR = vec4(0.0, 0.0, 0.0, 1.0);
	}
}
