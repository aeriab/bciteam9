extends Node2D

var chosen_color: Color
var timeVal: float = 0.0
@onready var white_circle = $WhiteCircle

func choose_color(color):
	chosen_color = color

func _process(delta):
	timeVal += delta
	if Global.deleting_sequence:
		Global.new_delay_time()
		Global.deleting_sequence = false
		if Global.green_is_here:
			Global.num_mistakes += 1
			Global.total_delay += 1.0
			Global.num_circles_popped += 1
		queue_free()
		

#func _input(event):
	#if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		#Global.new_delay_time(timeVal)
		#Global.num_mistakes -= 1
		#queue_free()
		#Global.deleting_sequence = false
