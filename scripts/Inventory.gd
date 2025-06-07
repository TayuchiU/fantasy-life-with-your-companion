class_name Inventory extends Resource

const DEFAULT_INVENTORY_SIZE = 5
const MAX_INVENTORY_SIZE = 20

signal inventory_changed(backpack)
signal item_added(item)
signal item_removed(item)
signal size_changed(size)

@export_group("Equipment")
#Equipment
@export var head:Equipment
@export var face:Equipment
@export var neck:Equipment
@export var shoulders:Equipment
@export var back:Equipment
@export var underlayer:Equipment
@export var torsowear:Equipment
@export var outerlayer:Equipment
@export var arms:Equipment
@export var r_wrist:Equipment
@export var l_wrist:Equipment
@export var hands:Equipment
@export var waist:Equipment
@export var undergarment:Equipment
@export var r_leg:Equipment
@export var l_leg:Equipment
@export var feet:Equipment
@export var r_held:Equipment
@export var l_held:Equipment

var equipment:Array:
	get:
		return [head, face, neck, shoulders, back, underlayer, torsowear, outerlayer, arms, r_wrist, l_wrist, hands, waist, undergarment, r_leg, l_leg, feet, r_held, l_held]

#Inventory Space
@export var backpack:Array:
	set(value):
		if value.size() > size:
			#Safety to avoid increasing Array size beyond current inventory size.
			return
		backpack = value
		inventory_changed.emit(backpack)
		
@export var size:int = DEFAULT_INVENTORY_SIZE:
	set(value):
		size = clamp(value, 1, MAX_INVENTORY_SIZE)
		size_changed.emit(size)

func has_item(item:Item) -> bool:
	if item in backpack or item in equipment:
		return true
	return false

func equip_item(item:Item, slot:String, bypass_inventory:bool = false) -> bool:
	if not item in backpack and not bypass_inventory:
		printerr("Attempted to equip item not in inventory without bypass_inventory: %s[%s]" % item.get_display_name(), item)
		return false
	set(slot, item)
	return true

func unequip_item(slot:String) -> Item:
	var _slot = get(slot)
	if not _slot:
		return
	var _item = _slot
	set(slot, null)
	return _item

func add_item(item:Item) -> bool:
	if backpack.size() + 1 > size:
		return false
	backpack.append(item)
	item_added.emit(item)
	return true

func remove_item(item:Item) -> Item:
	if item in backpack:
		var _item = item
		backpack.erase(item)
		item_removed.emit(item)
		return _item
	return

func change_size(new_size:int) -> void:
	size = new_size
	size_changed.emit(size)
