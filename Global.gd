extends Node

var average_delay: float
var num_circles_popped: int = 0
var total_delay: float = 0.0

var num_mistakes: int = 0

var diagnostic_scores: Array[float]

func new_delay_time(delay):
	num_circles_popped += 1
	total_delay += delay
	average_delay = total_delay / float(num_circles_popped)
	print(str(average_delay) + " seconds")

func add_diagnostic_score():
	average_delay = total_delay / float(num_circles_popped)
	diagnostic_scores.append(average_delay)
	num_circles_popped = 0
	total_delay = 0.0
