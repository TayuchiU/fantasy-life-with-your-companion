extends Resource
class_name Personality


@export_range(-100, 100) var morality:int:
	get:
		print("getting morality")
		return morality
	set(value):
		print("setting morality")
		morality = value
@export_range(-100, 100) var independence:int
@export_range(-100, 100) var sociability:int
@export_range(-100, 100) var outlook:int
@export_range(-100, 100) var tradition:int
@export_range(-100, 100) var sadomasochism:int
@export_range(-100, 100) var commitment:int
@export_range(-100, 100) var confidence:int
@export_range(-100, 100) var spirituality:int
@export_range(-100, 100) var demeanor:int
@export_range(-100, 100) var trust:int
@export_range(-100, 100) var curiosity:int
@export_range(-100, 100) var honesty:int
@export_range(-100, 100) var libido:int


func list_personality_stats() -> Dictionary:
	return {
		"morality": morality,
		"independence": independence,
		"sociability": sociability,
		"outlook": outlook,
		"tradition": tradition,
		"sadomasochism": sadomasochism,
		"commitment": commitment,
		"confidence": confidence,
		"spirituality": spirituality,
		"demeanor": demeanor,
		"trust": trust,
		"curiosity": curiosity,
		"honesty": honesty,
		"libido": libido
	}


func has(property: String):
	return get_property_list().map(func(prop): return prop.name).any(func(prop): return prop == property)


func get_stats():
	return get_property_list()


func get_personality_stat(personality_stat: String) -> PersonalityStat:
	if list_personality_stats().has(personality_stat):
		return list_personality_stats().get(personality_stat)
	else:
		print("personality_stat not found: ", personality_stat)
	return null


func modify_personality_stat(stat: String, value: int):
	if list_personality_stats().has(stat):
		list_personality_stats().get(stat).add(value)
	else:
		print("personality_stat not found: ", stat)
