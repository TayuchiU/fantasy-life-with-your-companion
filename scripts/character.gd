class_name Character extends Resource

signal name_changed(name)
signal age_changed(age)
signal inventory_changed(slot, item)
signal stat_changed(stat, value)
signal skill_changed(skill, value)
signal money_changed(money)

@export var character_name:String:
	set(new_name):
		if not new_name and not character_name:
			character_name = Utils.sanitize_string(new_name)
			return
		character_name = Utils.sanitize_string(new_name)
		name_changed.emit(character_name)

## TODO: Consider the use for the age system.
## Is it even worth tracking? How fast will time pass?
@export var age:int:
	set(new_age):
		if new_age <= 0:
			printerr("Attempted to set age to an unsupported value:")
		#In an unlikely event that the age goes beyond 100, there's no point in tracking it beyond that.
		age = clamp(new_age, 0, 100)
		age_changed.emit(self, age)

# TODO: Implement classes and uncomment.
@export var background:Background
@export var available_backgrounds:Array[Background]
@export var stats:Stats
# @export var skills:Skills

@export var inventory:Inventory

@export var money:int:
	set(new_money):
		if new_money < 0:
			printerr("Attempted to set money to an unsupported value: %f" % new_money)
			new_money = 0
		money = new_money
		money_changed.emit(money)

func add_item(item:Item) -> bool:
	if inventory.add_item(item):
		return true
	printerr("Failed to add item %s to %s's inventory." % item.get_display_name(), self.character_name)
	return false

func remove_item(item:Item) -> bool:
	if inventory.remove_item(item):
		return true
	printerr("Failed to remove item %s from %s's inventory." % item.get_display_name(), self.character_name)
	return false
