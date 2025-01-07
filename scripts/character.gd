extends Area2D
class_name Character


@export var sprite : Sprite2D
var is_active: bool = false


func _on_mouse_entered() -> void:
	sprite.material.set_shader_parameter("highlight_intensity", 0.1)
	is_active = true


func _on_mouse_exited() -> void:
	sprite.material.set_shader_parameter("highlight_intensity", 0)
	is_active = false


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_left"):
		DialogueManager.show_example_dialogue_balloon(
			load("res://dialogues/main.dialogue"), "bedroom_companion")
