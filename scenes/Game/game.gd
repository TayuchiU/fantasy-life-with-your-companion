extends Node
class_name Game

@onready var pause_menu = %PauseMenu
@onready var end_menu = %EndMenu

@onready var pause_checker_sprite = $PauseChecker

@onready var vfx_manager : VFXManager = $VFXManager

func _ready() -> void:
	GameFunctions.safe_sleeping.connect(_on_safe_sleeping)
	
	if SaveHelper.save_file_name_to_load.is_empty():
		return
	
	if not SaveHelper.load_saved_file_name() == OK:
		return
	
	pause_checker_sprite.rotation = \
		SaveHelper.last_loaded_data.get("pause_checker_sprite_rot", 0)


func _process(_delta):
	if pause_menu.visible == false and Input.is_action_just_pressed("ui_cancel"):
		pause_menu.show()
		pause_menu.set_process(true)
		get_tree().paused = true

func _on_win():
	end_menu.set_win()
	end_menu.show()
	get_tree().paused = true
	
func _on_gameover():
	end_menu.set_gameover()
	end_menu.show()
	get_tree().paused = true

func _on_pause_menu_ask_to_save() -> void:
	pause_menu.save_this_please({
		"pause_checker_sprite_rot":pause_checker_sprite.rotation
	})


func _on_wardrobe_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		State.action = "changing outfit"
		DialogueManager.show_example_dialogue_balloon(
			load("res://dialogues/main.dialogue"), "bedroom_wardrobe")
		


func _on_bed_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		State.action = "bed"
		DialogueManager.show_example_dialogue_balloon(
			load("res://dialogues/main.dialogue"), "bedroom_bed")


func _on_safe_sleeping():
	print("Game._on_safe_sleeping")
	vfx_manager.play("fade_out_in")
	DialogueManager.show_example_dialogue_balloon(
		load("res://dialogues/main.dialogue"), "bedroom_awake")
