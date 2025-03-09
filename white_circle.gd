extends Sprite2D

@onready var dot = $".."

func _ready():
	var mat = material
	if mat is ShaderMaterial:
		mat.set_shader_parameter("replace_color", dot.chosen_color)
