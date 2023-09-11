shader_type canvas_item;
render_mode unshaded;

uniform vec4 output_color : source_color = vec4(0.09, 0.42, 0.53, 1.0);
uniform vec4 bg_color : source_color = vec4(1.0);
uniform float density : hint_range(0.0, 0.2) = 0.1;

void fragment() {
	float x = VERTEX.x * density;
	float y = VERTEX.y * density;
	float a = cos(cos(min(sin(x) + y, x + sin(y))));
	float b = cos(sin(max(sin(y) + x, y + sin(x))));
	
	COLOR = a - b > 0.0 ? output_color : bg_color;
}
