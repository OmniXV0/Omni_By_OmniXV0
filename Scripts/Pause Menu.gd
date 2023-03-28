extends Control

var is_paused = false setget set_is_paused

func _on_PauseButton_pressed():
	self.is_paused = true
	
	$PauseMenuButtons/ResumeButton.grab_focus()
	$PauseMenuButtons/QuitButton.grab_focus()
	
	$PauseMenuButtonsSelect/ResumeButton.grab_focus()
	$PauseMenuButtonsSelect/QuitButton.grab_focus()
	
func _on_PauseButtonHover_pressed():
	self.is_paused = true
	
	$PauseMenuButtons/ResumeButton.grab_focus()
	$PauseMenuButtons/QuitButton.grab_focus()
	
	$PauseMenuButtonsSelect/ResumeButton.grab_focus()
	$PauseMenuButtonsSelect/QuitButton.grab_focus()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.is_paused = true
		
		$PauseMenuButtons/ResumeButton.grab_focus()
		$PauseMenuButtons/QuitButton.grab_focus()
	
		$PauseMenuButtonsSelect/ResumeButton.grab_focus()
		$PauseMenuButtonsSelect/QuitButton.grab_focus()

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _ready():
	$PauseMenuButtons/ResumeButton.grab_focus()
	$PauseMenuButtons/QuitButton.grab_focus()
	
	$PauseMenuButtonsSelect/ResumeButton.grab_focus()
	$PauseMenuButtonsSelect/QuitButton.grab_focus()
	
	if Input.is_key_pressed(KEY_ESCAPE):
		self.is_paused = false

func _on_ResumeButton_pressed():
	self.is_paused = false

func _on_QuitButton_pressed():
	$FadeIn.play("Fade In")

func _on_FadeIn_animation_finished(anim_name):
	self.is_paused = false
	Global.screen = 2
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
