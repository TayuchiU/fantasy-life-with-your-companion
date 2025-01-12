extends Panel


@export var label : RichTextLabel
@export var button: Button
@export var date_label : Label

var is_showing: bool = false

func _ready() -> void:
	var string_log: String = "[fill]"
	string_log += Globals.adventure_log
	string_log += "[/fill]"
	label.text = string_log
	Globals.adventure_log_changed.connect(on_adventure_log_changed)
	
	#Calendar
	refresh_date_label()
	Globals.calendar.calendar_changed.connect(_on_calendar_changed)


func on_adventure_log_changed():
	var string_log: String = "[fill]"
	string_log += Globals.adventure_log
	string_log += "[/fill]"
	label.text = string_log


func _on_button_pressed() -> void:
	var tween = create_tween()
	if is_showing:
		tween.tween_property(self, "position", Vector2(-850, 0), 0.3)
		button.text = ">"
	else:
		tween.tween_property(self, "position", Vector2.ZERO, 0.3)
		button.text = "<"
	is_showing = !is_showing


func _on_advance_time_button_pressed() -> void:
	Globals.calendar.advance_time()


func _on_calendar_changed() -> void:
	refresh_date_label()


func refresh_date_label():
	date_label.text = Globals.calendar.get_current_date_string()
