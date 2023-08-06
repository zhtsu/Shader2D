shader_type canvas_item;
render_mode unshaded;

uniform float cutoff:hint_range(0.0, 1.0);
uniform float width:hint_range(0.0, 1.0);
uniform float height:hint_range(0.0, 1.0);
uniform float speed:hint_range(0.0, 1.0);

void fragment()
{
	float alpha = 1.0;
	float wave_cutoff = cutoff - (sin((UV.x + TIME * speed) / width) - 1.0) * height;
	
	if (UV.y < wave_cutoff)
	{
		alpha = 0.0;
	}
	
	COLOR = vec4(COLOR.rgb, alpha);
}
