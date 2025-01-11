extends Control

@onready var personality_stat_row_scene = preload("res://scenes/personality_stat_row.tscn")
@export var personality_stats_container : VBoxContainer

func _ready() -> void:
	refresh_container()
	Globals.companion.personality_changed.connect(on_personality_change)


func on_personality_change():
	refresh_container()


func refresh_container():
	for child in personality_stats_container.get_children():
		child.queue_free()
	var personality = Globals.companion.list_personality_stats()
	for stat in personality:
		var row = personality_stat_row_scene.instantiate()
		print("personality_stat:", stat)
		row.initialize_values(stat, personality.get(stat).extreme_1, personality.get(stat).extreme_2, personality.get(stat).value)
		personality_stats_container.add_child(row)
