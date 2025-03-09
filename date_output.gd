extends Label




func add_current_time():
	var date_time = Time.get_datetime_string_from_system()
	text += date_time + "\n"
