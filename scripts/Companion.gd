class_name Companion extends Resource

@export var name:String
@export var nickname:String:
	get:
		if nickname:
			return nickname
		else:
			return name
@export_enum("Fox Humanoid") var race:String #TODO: Implement Race resource

@export_enum("Male", "Female") var gender: String

@export_group("Personality")
@export var personality:Personality

@export_group("Skills")
@export_subgroup("General")
@export_range(0, 100) var alchemy:int
@export_range(0, 100) var arcane:int
@export_range(0, 100) var bartering:int
@export_range(0, 100) var carpentry:int
@export_range(0, 100) var combat:int
@export_range(0, 100) var cooking:int
@export_range(0, 100) var diplomacy:int
@export_range(0, 100) var intimidation:int
@export_range(0, 100) var literacy:int
@export_range(0, 100) var lore:int
@export_range(0, 100) var medicine:int
@export_range(0, 100) var music:int
@export_range(0, 100) var painting:int
@export_range(0, 100) var smithing:int
@export_range(0, 100) var skullduggery:int
@export_range(0, 100) var stealth:int
@export_range(0, 100) var survival:int
@export_range(0, 100) var tailoring:int
@export_subgroup("Sexual")
@export_range(0, 100) var hands:int
@export_range(0, 100) var mouth:int
@export_range(0, 100) var feet:int
@export_range(0, 100) var breasts:int
@export_range(0, 100) var vaginal:int
@export_range(0, 100) var anal:int

var stats = {"strength": 5, "luck": 5, "gold": 20}

@export_group("Background")
@export var background:String: #TODO: Implement Background resource
	set(new_background):
		#Safety net, avoid setting the background if it is not available
		if not new_background in available_backgrounds:
			return
		else:
			background = new_background
#Determines what backgrounds the companion is eligible for.
@export var available_backgrounds:Array[String] #TODO: Change to Array[Background] when implemented


##signals
signal personality_changed


func list_personality_stats():
	return personality.list_personality_stats()


func modify_personality_stat(stat: String, value: int):
	if personality.has(stat):
		personality[stat] = clamp(personality[stat] + value, -100, 100)
		personality_changed.emit()
	else:
		print("Error: Invalid personality stat:", stat)
