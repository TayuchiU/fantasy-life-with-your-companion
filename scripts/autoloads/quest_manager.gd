extends Node

# Variables for quest data
var current_quest = {}
var current_optional_events = []
var current_required_events = []
var current_duration : int = 0
var intermissions: int = 0
var current_intermission: int = 0
var history = []
var is_complete: bool = false

var events_without_period_change: int = 0

# Load quest from JSON
func load_quest(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var json = JSON.new()
		var parse_result = json.parse(file.get_as_text())
		if parse_result == OK:
			current_quest = json.data
			current_duration = 0
			current_optional_events = []
			current_required_events = []
			is_complete = false
			print("Current quest: ", current_quest)
		else:
			print("Error parsing JSON: " + str(parse_result))
		file.close()
	
	start_quest()


# Roll a dice for stat check
func roll_dice(player_stat: int) -> int:
	return randi() % 20 + 1 + player_stat

# Evaluate the result of a roll
func evaluate_roll(event: Dictionary, player_roll: int) -> Dictionary:
	var difficulty = event["difficulty"]
	var result = {}
	
	var roll_difference = player_roll - difficulty
	if roll_difference >= 10:
		result = event["results"]["great_success"]
	elif roll_difference >= 0:
		result = event["results"]["moderate_success"]
	elif roll_difference > -10:
		result = event["results"]["moderate_failure"]
	else:
		result = event["results"]["great_failure"]
	
	return result


func start_quest():
	if current_quest["events"]:
		for e in current_quest["events"]:
			if e["optional"] == true:
				current_optional_events.append(e)
			else:
				current_required_events.append(e)
	var min_intermissions: int = 0
	var max_intermissions: int = 0
	if current_quest["intermission_min"]:
		min_intermissions = current_quest["intermission_min"]
	if current_quest["intermission_max"]:
		max_intermissions = current_quest["intermission_max"]
	
	intermissions = randi_range(min_intermissions, max_intermissions)
	current_intermission = 0
	while !is_complete:
		advance_quest()


func advance_quest():
	if current_intermission >= intermissions:
		var next_req_event = current_required_events.pop_front()
		if next_req_event == null:
			#quest done
			is_complete = true
		else:
			process_event(next_req_event["id"], CompanionValues.stats)
	else:
		current_intermission += 1
		var event = current_optional_events.pick_random()
		if event == null:
			print("Event not found")
			return
		process_event(event["id"], CompanionValues.stats)


func process_event(event_id: String, player_stats: Dictionary):
	var event = null
	
	# Find the event with the given ID
	for e in current_quest["events"]:
		if e["id"] == event_id:
			event = e
			break
	
	if event == null:
		print("Event not found: " + event_id)
		return
	
	# Perform the roll
	var player_roll = roll_dice(player_stats["luck"])  # Use luck or a relevant stat
	var result = evaluate_roll(event, player_roll)
	
	# Update player stats
	for stat in result["stat_modifiers"]:
		player_stats[stat] += result["stat_modifiers"][stat]
	
	# Update player personality
	for personality in result["personality_modifiers"]:
		CompanionValues.modify_personality_stat(personality, result["personality_modifiers"][personality])
	
	# Update game time
	var duration: int = 0
	if result["duration"]:
		if result["duration"] > 0:
			duration = result["duration"]
			current_duration += duration
			Calendar.advance_times(duration)
	else:
		events_without_period_change += 1
		var random_period_increase_chance = randi_range(events_without_period_change, 10)
		if random_period_increase_chance >= 9:
			Calendar.advance_time()
			events_without_period_change = 0
	
	var event_log = {
		"event_time": Calendar.get_current_date_simple(),
		"duration": duration,
		"event_id": event_id,
		"description": CompanionValues.replace_placeholders(event["description"]),
		"roll": player_roll,
		"result": result["text"]
	}
	# Log result
	history.append(event_log)
	
	add_event_log_to_log(event_log)


# Get the quest log
func get_history() -> Array:
	return history

func add_event_log_to_log(event_log):
	print("QuestManager.add_event_to_log: ", event_log)
	CompanionValues.add_quest_event_to_log(event_log)
