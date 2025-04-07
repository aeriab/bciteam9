extends AudioStreamPlayer

const AIR_HORN = preload("res://assets/air-horn.mp3")
const BELL = preload("res://assets/bell.mp3")
const CARTOON_JUMP = preload("res://assets/cartoon-jump.mp3")
const CARTOON_SLIDE_WHISTLE_DOWN = preload("res://assets/cartoon-slide-whistle-down.mp3")
const CARTOON_SLIDE_WHISTLE_UP = preload("res://assets/cartoon-slide-whistle-up.mp3")
const VINTAGE_CAR = preload("res://assets/vintage-car.mp3")

func play_wrong():
	var randNum = randf()
	if randNum < 0.1:
		stream = BELL
	elif randNum < 0.30:
		stream = AIR_HORN
	elif randNum < 0.50:
		stream = CARTOON_SLIDE_WHISTLE_UP
	elif randNum < 0.70:
		stream = CARTOON_SLIDE_WHISTLE_DOWN
	elif randNum < 0.90:
		stream = CARTOON_JUMP
	else:
		stream = VINTAGE_CAR
	play()
	
	pass


func play_right():
	var randNum = randf()
	if randNum < 0.9:
		stream = BELL
	elif randNum < 0.92:
		stream = AIR_HORN
	elif randNum < 0.94:
		stream = CARTOON_SLIDE_WHISTLE_UP
	elif randNum < 0.96:
		stream = CARTOON_SLIDE_WHISTLE_DOWN
	elif randNum < 0.98:
		stream = CARTOON_JUMP
	else:
		stream = VINTAGE_CAR
	play()
	
	pass
