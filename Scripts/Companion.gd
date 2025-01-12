class_name Companion extends Resource

@export var name:String
@export var nickname:String:
	get:
		if nickname:
			return nickname
		else:
			return name
@export_enum("Fox Humanoid") var race:String #TODO: Implement Race resource

@export_enum("Male", "Female") var gender: String

@export var personality:Personality
@export var skills:Skills

@export_group("Background")
@export var background:String: #TODO: Implement Background resource
	set(new_background):
		#Safety net, avoid setting the background if it is not available
		if not new_background in available_backgrounds:
			return
		else:
			background = new_background
#Determines what backgrounds the companion is eligible for.
@export var available_backgrounds:Array[String] #TODO: Change to Array[Background] when implemented

func set_personality(trait_name:String, value:int):
	return
