extends Node2D

@export var label : RichTextLabel
func _ready() -> void:
	CompanionValues.initialize_stats()
	var string_log: String = "[fill]"
	for i in 10:
		QuestManager.load_quest("res://mods/quests/lost_relic.json")
		var log = QuestManager.get_history()
		for entry in log:
			print("Event:" + str(entry["event_id"]))
			string_log += ("Event:" + str(entry["event_id"]) + "; " + entry["description"] + " Roll: " + str(entry["roll"]) + "; Result: " + str(entry["result"]) )
			string_log += "\n\n"
		
	string_log += "[/fill]"
	label.text = string_log
