class_name Background extends Resource

enum TAGS {
	# Existing
	COMMONER,     # General populace, everyday life
	NOBLE,        # Privileged, high social standing
	MERCANTILE,   # Trade, business, wealth acquisition
	MARTIAL,      # Combat-focused, military, warrior
	ESPIONAGE,    # Spying, intrigue, covert operations

	# Social Standing & Origin
	OUTLAW,       # Criminal, fugitive, operates outside the law
	SLAVE,        # Enslaved, lacking freedom
	URBANITE,     # City dweller, streetwise
	RURAL,        # Countryside, connected to nature or farming
	TRIBAL,       # Member of a specific tribe or clan, distinct customs
	EXILE,        # Banished, outcast from society

	# Skills & Professions
	SCHOLAR,      # Academic, knowledgeable, researcher
	ARTISAN,      # Crafter, builder, skilled with hands
	HEALER,       # Medical knowledge, restorative abilities
	PERFORMER,    # Entertainer, musician, actor
	SURVIVALIST,  # Adept in wilderness, resourceful
	LABORER,      # Physical worker, miner, construction

	# Beliefs & Affiliations
	DEVOUT,       # Religious, spiritual, dedicated to a faith or cause
	MYSTIC,       # Connection to the arcane, supernatural, or esoteric
	REVOLUTIONARY,# Seeks to overthrow existing structures, rebellious
	LEADER,       # Natural inclination to guide or command others
	EXPLORER,     # Driven by discovery, ventures into the unknown
}

#Name/Description
@export var display_name:String:
	set(new_name):
		if not display_name: # Check if current display_name is empty
			# Corrected printerr arguments. Using get_instance_id() for a unique ID.
			# The original message was a bit confusing if display_name was empty.
			printerr("Attempted to assign empty String to display_name for resource (ID: %s). Current display_name: '%s'. Input new_name: '%s'." % [get_instance_id(), display_name, new_name])
			display_name = Utils.sanitize_string(new_name)
			return
		display_name = Utils.sanitize_string(new_name)
@export_multiline var description:String:
	set(new_description):
		description = Utils.sanitize_string(new_description)
#Inventory
@export var initial_inventory:Array[Item]
@export var initial_money_bonus:int
#Stats
@export_group("Core Stats Modifiers", "_modifier")
@export_range(0, 100) var might_modifier:int
@export_range(0, 100) var finesse_modifier:int
@export_range(0, 100) var resolve_modifier:int
@export_range(0, 100) var acumen_modifier:int
@export_range(0, 100) var guile_modifier:int
var modifiers:Dictionary:
	get:
		return {
			"might" : might_modifier,
			"finesse" : finesse_modifier,
			"resolve" : resolve_modifier,
			"acumen" : acumen_modifier,
			"guile" : guile_modifier
		}
#Skills
@export var initial_skill_modifiers:Dictionary = {
	#TODO: Add initial skill modifiers.
}

@export var tags:Array[TAGS]