extends Node2D

const DOT = preload("res://dot.tscn")
var gameStarted: bool = false
@onready var timer = $Timer
@onready var hard_stop_timer = $hard_stop_timer

@onready var home_labels = $HomeLabels

@onready var scores_output = $HomeLabels/ScoresOutput
@onready var audio_stream_player = $AudioStreamPlayer

var good_to_press = false

var time_ellapsed: float = 0.0

func _on_start_button_pressed():
	Global.num_mistakes = 0
	home_labels.visible=false
	gameStarted = true
	timer.start()

var delay: float = 0.0


func _on_timer_timeout():
	if Global.num_circles_popped < 30:
		var coin_flip = randf()
		if coin_flip > 0.5:
			audio_stream_player.play_right()
			create_good_dot()
			good_to_press = true
			Global.green_is_here = true
			delay = 0.0
			#print("correct")
		else:
			audio_stream_player.play_wrong()
			create_bad_dot()
			good_to_press = false
			Global.green_is_here = false
			#print("incorrect")
		var rand_time_increase = randf_range(1.5, 4.5)
		timer.wait_time = rand_time_increase
		time_ellapsed += rand_time_increase
		hard_stop_timer.wait_time = 1.0
		hard_stop_timer.start()
	else:
		home_labels.visible = true
		Global.add_diagnostic_score()
		scores_output.update_scores()
		timer.stop()


func _on_hard_stop_timer_timeout():
	Global.deleting_sequence = true
	hard_stop_timer.stop()


func create_good_dot():
	var dot_instance = DOT.instantiate()
	var randScaleVal = randf_range(0.01,0.15)
	dot_instance.scale = Vector2(randScaleVal,randScaleVal)
	dot_instance.choose_color(Color.GREEN)
	dot_instance.position = Vector2(randf_range(-450.0,450.0),randf_range(-230.0,230.0))
	add_child(dot_instance)

func create_bad_dot():
	var dot_instance = DOT.instantiate()
	var randScaleVal = randf_range(0.01,0.15)
	dot_instance.scale = Vector2(randScaleVal,randScaleVal)
	dot_instance.choose_color(Color.RED)
	dot_instance.position = Vector2(randf_range(-450.0,450.0),randf_range(-230.0,230.0))
	add_child(dot_instance)

func _process(delta):
	delay += delta

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		if good_to_press:
			Global.total_delay += delay
			Global.num_circles_popped += 1
			Global.green_is_here = false
		else:
			Global.num_mistakes += 1
			#print("bad job")
