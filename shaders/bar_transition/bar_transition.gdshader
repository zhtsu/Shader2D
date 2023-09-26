shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	float alpha = 1.0;
	// Only for demo
	// You should use uniform 'progress' in your game
	float demo_progress = smoothstep(0.0, 1.0, sin(TIME * 2.0));
	
	if (UV.y < 0.5 && UV.x > demo_progress)
	{
		alpha = 0.0;
	}
	
	if (1.0 - UV.y < 0.5 && 1.0 - UV.x > demo_progress)
	{
		alpha = 0.0;
	}
	
	COLOR = vec4(COLOR.rgb, alpha);
}
