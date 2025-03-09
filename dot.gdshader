shader_type canvas_item;
uniform vec4 replace_color : source_color;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	if (tex_color.a != 0.0) {
		COLOR = replace_color;
	}
	
	// Called for every pixel the material is visible on.
}
