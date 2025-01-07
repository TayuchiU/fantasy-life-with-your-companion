extends HBoxContainer

@export var first_label : Label
@export var progress_bar : ProgressBar
@export var second_label : Label

func initialize_values(n: String, fl : String, pb : float) -> void:
	progress_bar.tooltip_text = n
	first_label.text = fl
	second_label.text = define_expertise_level(pb)
	progress_bar.value = pb


func define_expertise_level(progress_value: float) -> String:
	if (progress_value < 10):
			return "Novice"
	elif (progress_value < 30):
		return "Beginner"
	elif (progress_value < 50):
		return "Intermediate"
	elif (progress_value < 70):
		return "Advanced"
	elif (progress_value < 90):
		return "Expert"
	else:
		return "Master"
