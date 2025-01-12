class_name Personality extends Resource

signal personality_changed
signal quirk_acquired(quirk)
signal quirk_lost(quirk)

@export_range(-100, 100) var commitment:int:
	set(new_value):
		if new_value != commitment:
			commitment = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var confidence:int:
	set(new_value):
		if new_value != confidence:
			confidence = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var curiosity:int:
	set(new_value):
		if new_value != curiosity:
			curiosity = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var demeanor:int:
	set(new_value):
		if new_value != demeanor:
			demeanor = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var honesty:int:
	set(new_value):
		if new_value != honesty:
			honesty = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var independence:int:
	set(new_value):
		if new_value != independence:
			independence = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var libido:int:
	set(new_value):
		if new_value != libido:
			libido = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var morality:int:
	set(new_value):
		if new_value != morality:
			morality = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var outlook:int:
	set(new_value):
		if new_value != outlook:
			outlook = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var sadomasochism:int:
	set(new_value):
		if new_value != sadomasochism:
			sadomasochism = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var sociability:int:
	set(new_value):
		if new_value != sociability:
			sociability = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var spirituality:int:
	set(new_value):
		if new_value != spirituality:
			spirituality = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var tradition:int:
	set(new_value):
		if new_value != tradition:
			tradition = clamp(new_value, -100, 100)
			personality_changed.emit()
@export_range(-100, 100) var trust:int:
	set(new_value):
		if new_value != trust:
			trust = clamp(new_value, -100, 100)
			personality_changed.emit()

@export var quirks:Array[Quirk]

#TODO: Figure out a way to check for eligible Quirks, and a way to add/remove them.
