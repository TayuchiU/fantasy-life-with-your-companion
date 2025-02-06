extends Control

@onready var character_skill_scene = preload("res://Scenes/CharacterSkillRow.tscn")
@export var skills_container : VBoxContainer

func _ready() -> void:
	#CompanionValues.initialize_stats()
	#for skill_key in CompanionValues.skills:
	#	var skill = CompanionValues.skills.get(skill_key)
	#	var row = character_skill_scene.instantiate()
	#	row.initialize_values(skill.description, skill.skill_name, skill.value)
	#	skills_container.add_child(row)
	pass
