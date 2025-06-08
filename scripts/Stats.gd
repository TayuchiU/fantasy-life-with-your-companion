class_name Stats extends Resource

enum STAT {
	MIGHT,
	FINESSE,
	RESOLVE,
	ACUMEN,
	GUILE
}

enum MIGHT_THRESHOLD {
	FRAIL,
	STURDY,
	VIGOROUS,
	INDOMITABLE,
	TITAN
}

enum FINESSE_THRESHOLD {
	CLUMSY,
	NIMBLE,
	GRACEFUL,
	UNTOUCHABLE,
	PHANTASM
}

enum RESOLVE_THRESHOLD {
	WAVERING,
	STEADFAST,
	UNFLINCHING,
	ADAMANT,
	SANCTIFIED
}

enum ACUMEN_THRESHOLD {
	OBLIVIOUS,
	ASTUTE,
	BRILLIANT,
	OMNISCIENT,
	ORACLE
}

enum GUILE_THRESHOLD {
	GUILELESS,
	PERSUASIVE,
	BEGUILING,
	INESCAPABLE,
	PUPPETEER
}

signal stat_changed(stat, value)
signal threshold_changed(stat, threshold)

@export_range(0, 100) var might:int #Strength, Endurance
@export_range(0, 100) var finesse:int #Agility, Reflexes
@export_range(0, 100) var resolve:int #Willpower, Grit
@export_range(0, 100) var acumen:int #Intellect, Knowledge
@export_range(0, 100) var guile:int #Charisma, Beauty

var might_threshold:MIGHT_THRESHOLD
var finesse_threshold:FINESSE_THRESHOLD
var resolve_threshold:RESOLVE_THRESHOLD
var acumen_threshold:ACUMEN_THRESHOLD
var guile_threshold:GUILE_THRESHOLD

# Helper function to get the threshold for a given stat value and type
static func _get_threshold_for_value(stat_type: STAT, value: int):
	match stat_type:
		STAT.MIGHT:
			if value >= 80: return MIGHT_THRESHOLD.TITAN
			if value >= 60: return MIGHT_THRESHOLD.INDOMITABLE
			if value >= 40: return MIGHT_THRESHOLD.VIGOROUS
			if value >= 20: return MIGHT_THRESHOLD.STURDY
			return MIGHT_THRESHOLD.FRAIL
		STAT.FINESSE:
			if value >= 80: return FINESSE_THRESHOLD.PHANTASM
			if value >= 60: return FINESSE_THRESHOLD.UNTOUCHABLE
			if value >= 40: return FINESSE_THRESHOLD.GRACEFUL
			if value >= 20: return FINESSE_THRESHOLD.NIMBLE
			return FINESSE_THRESHOLD.CLUMSY
		STAT.RESOLVE:
			if value >= 80: return RESOLVE_THRESHOLD.SANCTIFIED
			if value >= 60: return RESOLVE_THRESHOLD.ADAMANT
			if value >= 40: return RESOLVE_THRESHOLD.UNFLINCHING
			if value >= 20: return RESOLVE_THRESHOLD.STEADFAST
			return RESOLVE_THRESHOLD.WAVERING
		STAT.ACUMEN:
			if value >= 80: return ACUMEN_THRESHOLD.ORACLE
			if value >= 60: return ACUMEN_THRESHOLD.OMNISCIENT
			if value >= 40: return ACUMEN_THRESHOLD.BRILLIANT
			if value >= 20: return ACUMEN_THRESHOLD.ASTUTE
			return ACUMEN_THRESHOLD.OBLIVIOUS
		STAT.GUILE:
			if value >= 80: return GUILE_THRESHOLD.PUPPETEER
			if value >= 60: return GUILE_THRESHOLD.INESCAPABLE
			if value >= 40: return GUILE_THRESHOLD.BEGUILING
			if value >= 20: return GUILE_THRESHOLD.PERSUASIVE
			return GUILE_THRESHOLD.GUILELESS
	return null # Should not happen if stat_type is valid

func change_stat(stat:STAT, value:int) -> void:
	var current_value: int
	var old_threshold
	# Apply the change and get current value & old threshold
	match stat:
		STAT.MIGHT:
			old_threshold = might_threshold
			self.might = clamp(self.might + value, 0, 100)
			current_value = self.might
		STAT.FINESSE:
			old_threshold = finesse_threshold
			self.finesse = clamp(self.finesse + value, 0, 100)
			current_value = self.finesse
		STAT.RESOLVE:
			old_threshold = resolve_threshold
			self.resolve = clamp(self.resolve + value, 0, 100)
			current_value = self.resolve
		STAT.ACUMEN:
			old_threshold = acumen_threshold
			self.acumen = clamp(self.acumen + value, 0, 100)
			current_value = self.acumen
		STAT.GUILE:
			old_threshold = guile_threshold
			self.guile = clamp(self.guile + value, 0, 100)
			current_value = self.guile
		_:
			printerr("Invalid stat type passed to change_stat: ", stat)
			return
	# Determine the new threshold
	var new_threshold = _get_threshold_for_value(stat, current_value)
	# Update the specific threshold variable if it has changed
	if new_threshold != old_threshold:
		match stat:
			STAT.MIGHT: might_threshold = new_threshold
			STAT.FINESSE: finesse_threshold = new_threshold
			STAT.RESOLVE: resolve_threshold = new_threshold
			STAT.ACUMEN: acumen_threshold = new_threshold
			STAT.GUILE: guile_threshold = new_threshold
		threshold_changed.emit(stat, new_threshold)
	stat_changed.emit(stat, current_value) # Emit with the new value of the stat