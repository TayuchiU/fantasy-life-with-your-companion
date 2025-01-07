extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Fade out function
func fade_out(duration: float) -> void:
	$ColorRect.color = Color(0, 0, 0, 255)
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished

# Fade in function
func fade_in(duration: float) -> void:
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished

# Combined fade out and in
func fade_out_and_in(duration: float) -> void:
	await fade_out(duration)
	await get_tree().create_timer(duration).timeout
	fade_in(duration)
