class_name Background extends Resource

signal background_changed
signal trait_gained(trait_name: String) # Example: For tracking specific traits
signal trait_lost(trait_name: String)

enum BackgroundType { NONE, MERCHANT, WARRIOR, NOBLE, ARTISAN, SCHOLAR,
INDEBTED, ENSLAVED, CAPTURED_ENEMY
 }
@export var background_type: BackgroundType = BackgroundType.NONE

@export_range(-100, 100) var wealth_status: int:
	set(new_value):
		if new_value != wealth_status:
			wealth_status = clamp(new_value, -100, 100)
			background_changed.emit()

@export_range(-100, 100) var street_wise: int: # -100 for doesn't know the underworld, 100 for purely born there
	set(new_value):
		if new_value != street_wise:
			street_wise = clamp(new_value, -100, 100)
			background_changed.emit()

@export_range(0, 10) var education_level: int: # 0 for no formal education, 10 for highly educated
	set(new_value):
		if new_value != education_level:
			education_level = clamp(new_value, 0, 10)
			background_changed.emit()

@export_range(-100, 100) var conflict_exposure: int: # -100 for peaceful upbringing, 100 for high conflict
	set(new_value):
		if new_value != conflict_exposure:
			conflict_exposure = clamp(new_value, -100, 100)
			background_changed.emit()

@export_range(-100, 100) var magical_affinity: int: # For magic if applicable
	set(new_value):
		if new_value != magical_affinity:
			magical_affinity = clamp(new_value, -100, 100)
			background_changed.emit()

@export_range(-100, 100) var social_status: int: # Beyond just wealth, includes reputation, standing in community
	set(new_value):
		if new_value != social_status:
			social_status = clamp(new_value, -100, 100)
			background_changed.emit()

# Quirks/Traits associated with the background
@export var background_traits: Array[Quirk] = []


# Description of the background
@export_multiline var description: String = ""

func add_trait(new_trait: Quirk):
	if not background_traits.has(new_trait):
		background_traits.append(new_trait)
		trait_gained.emit(new_trait.name)
		background_changed.emit() # Signal that the background as a whole has changed

func remove_trait(trait_to_remove: Quirk):
	if background_traits.has(trait_to_remove):
		background_traits.erase(trait_to_remove)
		trait_lost.emit(trait_to_remove.name)
		background_changed.emit() # Signal that the background as a whole has changed
