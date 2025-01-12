class_name Quirk extends Resource

@export var name:String
#Determines tier of quirk, used to evolve it into higher/lower tiers.
@export_enum("MILD", "MODERATE", "SEVERE") var tier:String
@export var requirements:Dictionary
@export var related_quirks:Array[Quirk]
@export var stat_adjustments:Dictionary

func check_requirements(personality:Personality):
	var _result = false
	return _result
