extends HBoxContainer

@export var first_label : Label
@export var progress_bar : ProgressBar
@export var second_label : Label

func initialize_values(n: String, fl : String, sl: String, pb : float) -> void:
	progress_bar.tooltip_text = n + ": " + str(pb)
	first_label.text = fl
	second_label.text = sl
	progress_bar.value = pb
