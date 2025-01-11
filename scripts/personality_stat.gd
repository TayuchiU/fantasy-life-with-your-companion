extends Resource
class_name PersonalityStat

@export var stat_name : String
@export var extreme_1 : String
@export var extreme_2 : String
@export_range(-100, 100) var value: int

var min_value: int = -100
var max_value: int = 100

func add(v: int):
	if value + v >= max_value:
		value = max_value
	elif value + v <= min_value:
		value = min_value
	else:
		value += v
