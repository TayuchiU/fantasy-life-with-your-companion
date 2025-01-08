extends Node


var companion: Companion
var player: String
var calendar: Calendar
var adventure_log: String

# Store pronoun mappings
var pronoun_map = {
	"Male": {
		"subject": "he",       # Subject pronoun (%csp)
		"object": "him",       # Object pronoun (%cop)
		"possessive": "his"    # Possessive pronoun (%cpp)
	},
	"Female": {
		"subject": "she",      # Subject pronoun (%csp)
		"object": "her",       # Object pronoun (%cop)
		"possessive": "her"    # Possessive pronoun (%cpp)
	}
}

signal adventure_log_changed

func _ready() -> void:
	companion = load("res://resources/Fay.tres") #TODO make a scene for choosing the companion on game start when more are available
	calendar = Calendar.new()
	adventure_log = ""


func replace_placeholders(text: String) -> String:
	var pronouns = pronoun_map.get(companion.gender, pronoun_map["Male"]) # Default to male if gender not found
	text = text.replace("%csp", pronouns["subject"])
	text = text.replace("%cop", pronouns["object"])
	text = text.replace("%cpp", pronouns["possessive"])
	text = text.replace("%c", companion.name)
	return text


func add_quest_event_to_log(entry):
	adventure_log += (entry["event_time"] + ": " + entry["description"] + " Roll: " + str(entry["roll"]) + "; Result: " + str(entry["result"]))
	adventure_log += "\n\n"
	adventure_log_changed.emit()

#Globals.replace_placeholders(event["description"], Globals.companion.sex)
