class_name Background extends Resource

@export var display_name:String:
	set(new_name):
		if not display_name:
			printerr("Attempted to assign empty String to display_name to %d. Assigning default name to %s" % self.id, self.display_name)
			self.name = Utils.sanitize_string(new_name)
			return
		display_name = Utils.sanitize_string(new_name)
@export_multiline var description:String:
	set(new_description):
		description = Utils.sanitize_string(new_description)

@export var initial_money_bonus: int
@export var core_stat_modifiers:Stats
@export var initial_skill_modifiers:Dictionary = {
	#TODO: Add initial skill modifiers.
}
