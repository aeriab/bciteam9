extends Label

var reaction_times_string: String = ""
@onready var date_output = $"../DateOutput"
@onready var mistakes_output = $"../MistakesOutput"

func update_scores():
	reaction_times_string = ""
	for i in Global.diagnostic_scores:
		reaction_times_string += str(snappedf(i, 0.00001)) + " seconds\n"
	text = reaction_times_string
	
	date_output.add_current_time()
	mistakes_output.add_current_mistakes()
	
