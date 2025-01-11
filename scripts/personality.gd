extends Resource
class_name Personality


@export_range(-100, 100) var morality:int:
	get:
		print("getting morality")
		return morality
	set(value):
		print("setting morality")
		morality = clamp(morality + value, -100, 100)
@export_range(-100, 100) var independence:int:
	set(value):
		independence = clamp(independence + value, -100, 100)
@export_range(-100, 100) var sociability:int:
	set(value):
		sociability = clamp(sociability + value, -100, 100)
@export_range(-100, 100) var outlook:int:
	set(value):
		outlook = clamp(outlook + value, -100, 100)
@export_range(-100, 100) var tradition:int:
	set(value):
		tradition = clamp(tradition + value, -100, 100)
@export_range(-100, 100) var sadomasochism:int:
	set(value):
		sadomasochism = clamp(sadomasochism + value, -100, 100)
@export_range(-100, 100) var commitment:int:
	set(value):
		commitment = clamp(commitment + value, -100, 100)
@export_range(-100, 100) var confidence:int:
	set(value):
		confidence = clamp(confidence + value, -100, 100)
@export_range(-100, 100) var spirituality:int:
	set(value):
		spirituality = clamp(spirituality + value, -100, 100)
@export_range(-100, 100) var demeanor:int:
	set(value):
		demeanor = clamp(demeanor + value, -100, 100)
@export_range(-100, 100) var trust:int:
	set(value):
		trust = clamp(trust + value, -100, 100)
@export_range(-100, 100) var curiosity:int:
	set(value):
		curiosity = clamp(curiosity + value, -100, 100)
@export_range(-100, 100) var honesty:int:
	set(value):
		honesty = clamp(honesty + value, -100, 100)
@export_range(-100, 100) var libido:int:
	set(value):
		libido = clamp(libido + value, -100, 100)


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
