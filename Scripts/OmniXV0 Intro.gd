extends Node

var OmniXV0Cursor = load("res://Sprites/OmniXV0 Cursor.png")
var VOlihiNCursor = load("res://Sprites/0VOlihiN Cursor.png")

func _ready():
	set_custom_mouse_cursor_2()
	
func set_custom_mouse_cursor_1():
	Input.set_custom_mouse_cursor(OmniXV0Cursor)
	
func set_custom_mouse_cursor_2():
	Input.set_custom_mouse_cursor(VOlihiNCursor)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton || event is InputEventKey:
		if event.pressed:
			get_tree().change_scene("res://Scenes/Main Menu.tscn")

func _on_OmniXV0IntroAnimation_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
