class_name Skills extends Resource

signal skills_changed

@export_range(0, 100) var alchemy:int:
	set(new_value):
		if new_value != alchemy:
			alchemy = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var arcane:int:
	set(new_value):
		if new_value != arcane:
			arcane = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var bartering:int:
	set(new_value):
		if new_value != bartering:
			bartering = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var carpentry:int:
	set(new_value):
		if new_value != carpentry:
			carpentry = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var combat:int:
	set(new_value):
		if new_value != combat:
			combat = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var cooking:int:
	set(new_value):
		if new_value != cooking:
			cooking = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var diplomacy:int:
	set(new_value):
		if new_value != diplomacy:
			diplomacy = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var intimidation:int:
	set(new_value):
		if new_value != intimidation:
			intimidation = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var literacy:int:
	set(new_value):
		if new_value != literacy:
			literacy = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var lore:int:
	set(new_value):
		if new_value != lore:
			lore = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var medicine:int:
	set(new_value):
		if new_value != medicine:
			medicine = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var music:int:
	set(new_value):
		if new_value != music:
			music = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var painting:int:
	set(new_value):
		if new_value != painting:
			painting = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var smithing:int:
	set(new_value):
		if new_value != smithing:
			smithing = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var skullduggery:int:
	set(new_value):
		if new_value != skullduggery:
			skullduggery = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var stealth:int:
	set(new_value):
		if new_value != stealth:
			stealth = clamp(new_value, 0, 100)
			skills_changed.emit()

@export_range(0, 100) var survival:int:
	set(new_value):
		if new_value != survival:
			survival = clamp(new_value, 0, 100)
			skills_changed
