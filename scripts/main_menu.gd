extends Node2D

@onready var transition = $Transition
var bedroomScene = preload("res://scenes/bedroom.tscn")

func _ready():
	transition.play("fade_in")

func _on_play_pressed():
	transition.play("fade_out")

func _on_transition_animation_finished(anim_name):
	if(anim_name == "fade_out") :
		get_tree().change_scene_to_packed(bedroomScene);
