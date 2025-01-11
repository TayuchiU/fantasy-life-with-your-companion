extends Node2D


func _ready() -> void:
	Globals.companion.modify_personality_stat("morality", 105)
	print(Globals.companion.list_personality_stats())
