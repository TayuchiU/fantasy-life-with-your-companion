class_name Equipment extends Item

enum TYPE {
    UNDERGARMENT,
    UNDERLAYER,
    TORSOWEAR,
    OUTERLAYER,
    BACK,
    HEAD,
    FACE,
    NECK,
    SHOULDERS,
    ARMS,
    WRISTS,
    HANDS,
    WAIST,
    LEGS,
    FEET,
    HELD
}

@export var type:TYPE
@export_subgroup("Covering")
@export var face:bool
@export var head:bool:
    set(value):
        if value:
            self.face = true
            self.head = true
        else:
            self.head = false
@export var chest:bool
@export var groin:bool
@export var ass:bool
@export var all:bool:
    set(value):
        if value:
            self.face = true
            self.head = true
            self.chest = true
            self.groin = true
            self.ass = true
            self.all = true
        else:
            self.all = false