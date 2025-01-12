extends Resource
class_name CharacterSkill

@export var skill_name : String
@export var value : int
@export var description : String

var min_value: int = 0
var max_value: int = 100


func get_skill_name():
	return skill_name


func get_value():
	return value


func get_description():
	return description
