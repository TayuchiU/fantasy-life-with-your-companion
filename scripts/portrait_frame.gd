extends TextureButton

@export var stats_window : Control
@export var internal_texture : Texture2D
@export var initial_pos : Vector2
@export var final_pos : Vector2
@export var is_show_behind_parent : bool

@onready var portrait = $Portrait


func _ready() -> void:
	if internal_texture:
		portrait.texture = internal_texture
	portrait.show_behind_parent = is_show_behind_parent


func _on_mouse_entered() -> void:
	#material.set_shader_parameter("highlight_intensity", 0.1)
	var t = create_tween()
	t.tween_property(stats_window, "position", final_pos, 0.2)


func _on_mouse_exited() -> void:
	if button_pressed:
		return
	#material.set_shader_parameter("highlight_intensity", 0)
	var t = create_tween()
	t.tween_property(stats_window, "position", initial_pos, 0.2)


func _on_pressed() -> void:
	if button_pressed:
		modulate = Color.CHOCOLATE
	else:
		modulate = Color.WHITE
