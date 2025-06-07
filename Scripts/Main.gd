extends Node2D
class_name Main

@export var ui : Control

@export var location: Sprite2D

func _ready() -> void:
	SceneManager.load_scenes_from_folder("mods")
	SceneManager.load_scene("Bedroom")
	var scene_data = SceneManager.get_current_scene_data()
	var scene_location = scene_data.get("location")
	load_location(scene_location)
	
	show_ui()


func show_ui() -> void:
	ui.visible = true


func hide_ui() -> void:
	ui.visible = false

func load_location(newLoc : String) -> void:
	location.texture = load(newLoc)


func _on_wardrobe_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		#State.action = "changing outfit"
		DialogueManager.show_example_dialogue_balloon(
			load("res://dialogues/main.dialogue"), "bedroom_wardrobe")


func _on_bed_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		#State.action = "bed"
		DialogueManager.show_example_dialogue_balloon(
			load("res://dialogues/main.dialogue"), "bedroom_bed")
