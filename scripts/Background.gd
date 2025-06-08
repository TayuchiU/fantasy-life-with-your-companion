class_name Background extends Resource

enum TAGS {
    # ORIGINS
    URBAN, # City
    WILDERLANDS, # Wilderness
    HEARTLANDS, # Rural
    CLAN_BOUND, # Tribal
    OUTLANDER, # Foreigner
    # CASTES
    HIGHBORN, # Nobles
    LOWBORN, # Commoners
    ENSLAVED, # Slaves/Ex-Slaves
    MERCHANT, # Merchants
    CASTELESS, # Outcasts
    # VOCATIONS
    WARRIOR,
    MYSTIC,
    SCHOLAR,
    ARTIFICER,
    SCOUT,
    HEALER,
    DIPLOMAT,
    PERFORMER,
    SHADOW,
    WARDEN,
    LABORER,
    # REPUTATIONS
    HONORBOUND,
    INFAMOUS,
    EXILED,
    PIONEER,
    SURVIVOR,
}

# Name/Description
@export var display_name:String:
	set(new_name):
		if not display_name: #  Check if current display_name is empty
			#  Corrected printerr arguments. Using get_instance_id() for a unique ID.
			#  The original message was a bit confusing if display_name was empty.
			printerr("Attempted to assign empty String to display_name for resource (ID: %s). Current display_name: '%s'. Input new_name: '%s'." % [get_instance_id(), display_name, new_name])
			display_name = Utils.sanitize_string(new_name)
			return
		display_name = Utils.sanitize_string(new_name)
@export_multiline var description:String:
	set(new_description):
		description = Utils.sanitize_string(new_description)
# Inventory
@export var initial_inventory:Array[Item]
@export var initial_money_bonus:int
# Stats
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
# Skills
@export var initial_skill_modifiers:Dictionary = {
	# TODO: Add initial skill modifiers.
}

@export var tags:Array[TAGS]