extends Node
class_name Calendar

# Define the structure for months, days, and periods
@export var months: Array = []
@export var day_names: Array = []
@export var time_periods: Array = ["Morning", "Midday", "Afternoon", "Night"]

# Events and holidays stored by day
var special_days: Dictionary = {}

# Current time tracking
var current_year: int = 1240
var current_month: int = 0
var current_day: int = 0
var current_period: int = 0

signal calendar_changed

# Initialize the calendar
func _init():
	# Example setup: Define some default months and day names if none are provided
	if months.is_empty():
		months = [{"name": "Bloumen", "days": 40}, 
		{"name": "Heisson", "days": 40},
		{"name": "Fallef", "days": 40},
		{"name": "Kaltstrom", "days": 40}
		]
	if day_names.is_empty():
		day_names = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

# Advance to the next time period
func advance_time():
	current_period += 1
	if current_period >= time_periods.size():
		current_period = 0
		advance_day()
	calendar_changed.emit()

func advance_times(period_amount: int):
	if period_amount < 0:
		return
	current_period += period_amount
	while current_period >= time_periods.size():
		current_period -= time_periods.size()
		advance_day()
	calendar_changed.emit()

# Advance to the next day
func advance_day():
	current_day += 1
	if current_day >= months[current_month]["days"]:
		current_day = 0
		advance_month()
	calendar_changed.emit()

# Advance to the next month
func advance_month():
	current_month += 1
	if current_month >= months.size():
		current_month = 0
		advance_year()
	calendar_changed.emit()


func advance_year():
	current_year += 1
	calendar_changed.emit()

# Add a special event or holiday
func add_special_day(month: int, day: int, date_name: String, description: String):
	if not special_days.has(month):
		special_days[month] = {}
	special_days[month][day] = {"name": date_name, "description": description}

# Get the current date as a formatted string
func get_current_date_string() -> String:
	return "Day: %d (%s), Month: %s, Year: %d, Period: %s" % [
		current_day + 1,
		day_names[current_day % day_names.size()],
		months[current_month]["name"],
		current_year + 1,
		time_periods[current_period]
	]


func get_current_date_simple() -> String:
	return "%s/%s/%d - %s" % [
		str(current_day + 1).pad_zeros(2),
		months[current_month]["name"][0],
		current_year + 1,
		time_periods[current_period]
	]


# Check if the current day is special
func is_special_day(month: int, day: int) -> bool:
	return special_days.has(month) and special_days[month].has(day)

# Get details of a special day
func get_special_day_details(month: int, day: int) -> Dictionary:
	return special_days.get(month, {}).get(day, {})

# Debug function to print the entire calendar for a month
func print_month(month: int):
	if month < 0 or month >= months.size():
		print("Invalid month!")
		return
	print("Month:", months[month]["name"])
	for day in range(months[month]["days"]):
		var is_special = is_special_day(month, day)
		print("Day %d (%s)%s" % [day + 1, day_names[day % day_names.size()], " [Special]" if is_special else ""])
