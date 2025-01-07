extends Control

@onready var personality_stat_row_scene = preload("res://scenes/personality_stat_row.tscn")
@export var personality_stats_container : VBoxContainer

func _ready() -> void:
	CompanionValues.initialize_stats()
	refresh_container()
	CompanionValues.personality_changed.connect(on_personality_change)


func on_personality_change():
	refresh_container()


func refresh_container():
	for child in personality_stats_container.get_children():
		child.queue_free()
	for personality_stat_key in CompanionValues.personality_stats:
		var personality_stat = CompanionValues.personality_stats.get(personality_stat_key)
		var row = personality_stat_row_scene.instantiate()
		row.initialize_values(personality_stat.stat_name, personality_stat.extreme_1, personality_stat.extreme_2, personality_stat.value)
		personality_stats_container.add_child(row)
