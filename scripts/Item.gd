class_name Item extends Resource
@export var item_name:String:
    set(new_name):
        if not item_name:
            printerr("Attempted to assign empty String to item_name to %s. Assigning default name to %s" % self.id, self.item_name)
            self.name = Utils.sanitize_string(new_name)
            return
        self.item_name = Utils.sanitize_string(new_name)
@export_multiline var description:String
@export var value:int
@export var core_stat_modifiers:Dictionary
@export var initial_skill_modifiers:Dictionary
@export var flags:Array

func get_display_name() -> String:
    return self.item_name

func has_flag(flag:String) -> bool:
    if flag in self.flags:
        return true
    return false