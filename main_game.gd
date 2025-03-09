extends Node2D

const DOT = preload("res://dot.tscn")
var gameStarted: bool = false
@onready var timer = $Timer

@onready var home_labels = $HomeLabels

@onready var scores_output = $HomeLabels/ScoresOutput

func _on_start_button_pressed():
	Global.num_mistakes = 0
	home_labels.visible=false
	gameStarted = true
	timer.start()

func _on_timer_timeout():
	
	if Global.num_circles_popped < 10:
		create_dot()
		timer.wait_time = randf_range(0.5, 2.5)
	else:
		home_labels.visible = true
		Global.add_diagnostic_score()
		scores_output.update_scores()
		timer.stop()

func create_dot():
	var dot_instance = DOT.instantiate()
	var randScaleVal = randf_range(0.01,0.15)
	dot_instance.scale = Vector2(randScaleVal,randScaleVal)
	dot_instance.choose_color(Color.RED)
	dot_instance.position = Vector2(randf_range(-450.0,450.0),randf_range(-230.0,230.0))
	add_child(dot_instance)

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		Global.num_mistakes += 1
		print(Global.num_mistakes)
