shader_type canvas_item;

uniform float  visibility_percentage : hint_range(0, 100, 1);

void fragment() {
	vec4 input_color = texture(TEXTURE,UV);
	float current_alpha = (input_color.a * visibility_percentage)/100.0;
	COLOR.a = current_alpha;
}
