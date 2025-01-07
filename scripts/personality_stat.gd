extends Node
class_name PersonalityStat

var stat_name : String
var extreme_1 : String
var extreme_2 : String

var value : float
var min_value = -100.0
var max_value = 100.0

func _init(n, e1, e2, v) -> void:
	stat_name = n
	extreme_1 = e1
	extreme_2 = e2
	value = v
