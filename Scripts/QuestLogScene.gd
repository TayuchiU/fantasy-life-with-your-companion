extends Node2D

@export var label : RichTextLabel
func _ready() -> void:
	CompanionValues.initialize_stats()
	var string_log: String = "[fill]"
	string_log += CompanionValues.adventure_log
	string_log += "[/fill]"
	label.text = string_log
	CompanionValues.adventure_log_changed.connect(on_adventure_log_changed)


func on_adventure_log_changed():
	var string_log: String = "[fill]"
	string_log += CompanionValues.adventure_log
	string_log += "[/fill]"
	label.text = string_log
