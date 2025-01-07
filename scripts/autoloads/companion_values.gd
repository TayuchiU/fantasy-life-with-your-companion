extends Node

var is_initialized: bool = false
var companion_name: String = "Fay"
var player_treatment: String = "Sir"
var companion_treatment: String = "Fay"
var personality_stats: Dictionary = {}
var skills: Dictionary = {}
var stats: Dictionary = {}
var adventure_log : String = ""

# Store pronoun mappings
var pronoun_map = {
	"male": {
		"subject": "he",       # Subject pronoun (%csp)
		"object": "him",       # Object pronoun (%cop)
		"possessive": "his"    # Possessive pronoun (%cpp)
	},
	"female": {
		"subject": "she",      # Subject pronoun (%csp)
		"object": "her",       # Object pronoun (%cop)
		"possessive": "her"    # Possessive pronoun (%cpp)
	}
}

enum CompanionSex { MALE, FEMALE }


signal personality_changed
signal adventure_log_changed


func initialize_stats():
	if is_initialized == false:
		add_personality_stat("morality", "Egoism", "Altruism", 0)
		add_personality_stat("independence", "Obedience", "Autonomy", 0)
		add_personality_stat("sociability", "Introversion", "Extroversion", 0)
		add_personality_stat("outlook", "Pessimism", "Optimism", 0)
		add_personality_stat("tradition", "Traditional", "Rebellious", 0)
		add_personality_stat("cruelty", "Sadist", "Masochist", 0)
		add_personality_stat("commitment", "Fanaticism", "Fleeting", 0)
		add_personality_stat("confidence", "Insecurity", "Confidence", 0)
		add_personality_stat("spirituality", "Heretical", "Religious", 0)
		add_personality_stat("demeanor", "Serious", "Humorous", 0)
		add_personality_stat("trust", "Suspicious", "Gullible", 0)
		add_personality_stat("curiosity", "Apathetic", "Curious", 0)
		add_personality_stat("honesty", "Deceptive", "Honest", 0)
		add_personality_stat("sexuality", "Hypersexual", "Frigid", 0)
		
		add_skills()
		is_initialized = true
		
		stats = {"strength": 5, "luck": 10, "gold": 0}


func add_personality_stat(stat_name: String, negative: String, positive: String, value: int):
	var stat = PersonalityStat.new(stat_name, negative, positive, value)
	personality_stats[stat_name] = stat


func add_skill(skill_resource: CharacterSkill):
	skills[skill_resource.get_skill_name()] = skill_resource


func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func add_skills():
	var path = "res://assets/resources/character_skills/"
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				if file_name.get_extension() == "tres":
					var skill_resource : CharacterSkill = load(path + file_name)
					add_skill(skill_resource)
				if file_name.get_extension() == "remap":
					file_name = file_name.replace(".remap", "")
					var skill_resource : CharacterSkill = load(path + file_name)
					add_skill(skill_resource)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func modify_personality_stat(key: String, value: float):
	if personality_stats[key]:
		personality_stats[key].value += value
		print("Key: ", key, " Value: ", personality_stats[key].value)
		personality_changed.emit()
	else:
		print("Personality Stat not found: ", key)


func add_quest_event_to_log(entry):
	adventure_log += (entry["event_time"] + ": " + entry["description"] + " Roll: " + str(entry["roll"]) + "; Result: " + str(entry["result"]))
	adventure_log += "\n\n"
	adventure_log_changed.emit()


func procedure(values: Array, DesiredType: Script) -> void:
	for value in values:
		if is_of_type(value, DesiredType):
			print("found value")


func is_of_type(value, DesiredType: Script) -> bool:
	if not value is Object:
		return false
	return is_of_type_internal(DesiredType, (value as Object).get_script())


func is_of_type_internal(DesiredType: Script, CurrentType: Script) -> bool:
	return true if CurrentType == DesiredType else is_of_type_internal(DesiredType, CurrentType.get_base_script())


# Replace placeholders in the text
func replace_placeholders(text: String, gender: String) -> String:
	var pronouns = pronoun_map.get(gender, pronoun_map["male"]) # Default to male if gender not found
	text = text.replace("%csp", pronouns["subject"])
	text = text.replace("%cop", pronouns["object"])
	text = text.replace("%cpp", pronouns["possessive"])
	text = text.replace("%c", companion_name)
	return text
