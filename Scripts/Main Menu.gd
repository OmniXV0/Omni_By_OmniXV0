extends Control

export(Script) var game_save_class

var save_vars = ["tutorialcheckmark_pos"]

var OmniXV0Cursor = load("res://Sprites/OmniXV0 Cursor.png")
var VOlihiNCursor = load("res://Sprites/0VOlihiN Cursor.png")

onready var tutorialcheckmark = $TutorialCheckMark

func set_custom_mouse_cursor_1():
	Input.set_custom_mouse_cursor(OmniXV0Cursor)
	
func set_custom_mouse_cursor_2():
	Input.set_custom_mouse_cursor(VOlihiNCursor)
	
func set_custom_mouse_cursor_disappear():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func set_custom_mouse_cursor_appear():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

signal timeout

const TIME_PERIOD = 2

var time = 0

enum State {
	STATE_0,
	STATE_1,
	STATE_2,
	STATE_3,
	STATE_4
}

var current_state = State.STATE_0

func _ready():
	load_world()
	if (Global.level == 2):
		tutorialcheckmark.position.y = 400
		save_world()
		
	if (Global.screen == 2):
		change_state(State.STATE_2)
	else:
		change_state(State.STATE_0)
		
	set_custom_mouse_cursor_1()
	set_custom_mouse_cursor_appear()
	
func verify_save(world_save):
	for v in save_vars:
		if world_save.get(v) == null:
			return false
	return true
			
func load_world():
	var dir = Directory.new()
	if not dir.file_exists("user://Omni By OmniXV0 Save Files/Omni.tres"):
		return false
		
	var world_save = load("user://Omni By OmniXV0 Save Files/Omni.tres")
	if not verify_save(world_save):
		return false
		
	$TutorialCheckMark.position = world_save.tutorialcheckmark_pos
	return true
	
func save_world():
	var new_save = game_save_class.new()
	new_save.tutorialcheckmark_pos = $TutorialCheckMark.position
	
	var dir = Directory.new()
	if not dir.dir_exists("user://Omni By OmniXV0 Save Files/"):
		dir.make_dir_recursive("user://Omni By OmniXV0 Save Files/")
	
	ResourceSaver.save("user://Omni By OmniXV0 Save Files/Omni.tres", new_save)
	
func _process(delta):
	time += delta
	match current_state:
		State.STATE_0:
			time = 0
			if time > TIME_PERIOD:
				emit_signal("timeout")
				print("timeout_0")
				time = 0
				change_state(State.STATE_1)
				
			$StartButton/StartButtonMoveIn.play("Start Button Move In")
				
			$OmniLogo.visible = true
			$OmniXV0.visible = true
			$NihilLogo.visible = false
			$VOlihiN.visible = false
	
			$ByText.visible = true
			$PressEnter.visible = true
			$PoweredByGodot.visible = true
			$CopyrightOmniXV0.visible = true
			$OmniVersion.visible = true
			$OmniXV0OmniNihilMusicName.visible = true
	
			$StageSelectText.visible = false
			$OmniXV0Tutorial.visible = false
			$TutorialText.visible = false
			$TutorialButton.visible = false
			$TutorialButton/TutorialButtonMoveOut.play("Tutorial Button Move Out")
			$RightArrow.visible = false
			$LeftArrow.visible = false
			$OmniXV0OmniMusicName.visible = false
			
			$TutorialButtonPressed.visible = false
			
			tutorialcheckmark.visible = false
			#tutorialcheckmark.position.x = 900
	
			$ComingSoonText.visible = false
	
			$BackButton.visible = false
	
		State.STATE_1:
			time = 0
			
			$StartButton/StartButtonMoveIn.play("Start Button Move In")
			
			$OmniLogo.visible = true
			$OmniXV0.visible = true
			$NihilLogo.visible = false
			$VOlihiN.visible = false
	
			$ByText.visible = true
			$PressEnter.visible = true
			$PoweredByGodot.visible = true
			$CopyrightOmniXV0.visible = true
			$OmniVersion.visible = true
			$OmniXV0OmniNihilMusicName.visible = true
	
			$StageSelectText.visible = false
			$OmniXV0Tutorial.visible = false
			$TutorialText.visible = false
			$TutorialButton.visible = false
			$TutorialButton/TutorialButtonMoveOut.play("Tutorial Button Move Out")
			$RightArrow.visible = false
			$LeftArrow.visible = false
			$OmniXV0OmniMusicName.visible = false
			
			$TutorialButtonPressed.visible = false
			
			tutorialcheckmark.visible = false
			#tutorialcheckmark.position.x = 900
	
			$ComingSoonText.visible = false
	
			$BackButton.visible = false
			
			if Input.is_key_pressed(KEY_ESCAPE):
				
				$OmniLogo.visible = false
				$OmniXV0.visible = false
				$NihilLogo.visible = true
				$VOlihiN.visible = true
			
				$Background.modulate = Color(0, 0, 0, 1)
				$ByText.modulate = Color(1, 1, 1, 1)
				$PressEnter.modulate = Color(1, 1, 1, 1)
				$PoweredByGodot.modulate = Color(1, 1, 1, 1)
				$CopyrightOmniXV0.modulate = Color(1, 1, 1, 1)
				$OmniVersion.modulate = Color(1, 1, 1, 1)
				$OmniXV0OmniNihilMusicName.modulate = Color(1, 1, 1, 1)
		
				$StageSelectText.visible = false
				$OmniXV0Tutorial.visible = false
				$TutorialText.visible = false
				$TutorialButton.visible = false
				$RightArrow.visible = false
				$LeftArrow.visible = false
				$OmniXV0OmniMusicName.visible = false
	
				$ComingSoonText.visible = false
	
				$BackButton.visible = false
				get_tree().quit()
	
			if Input.is_key_pressed(KEY_ENTER):
				change_state(State.STATE_2)
				
		State.STATE_2:
			$StartButton/StartButtonMoveOut.play("Start Button Move Out")
			
			$OmniLogo.visible = false
			$OmniXV0.visible = false
			$ByText.visible = false
			$PressEnter.visible = false
			$PoweredByGodot.visible = false
			$CopyrightOmniXV0.visible = false
			$OmniVersion.visible = false
			$OmniXV0OmniNihilMusicName.visible = false
			
			$StageSelectText.visible = true
			
			$OmniXV0Tutorial.visible = true
			$OmniXV0Tutorial.position = Vector2(320, 240)
			
			$TutorialButton.visible = true
			$TutorialButton.rect_position = Vector2(258, 178)
			
			$TutorialText.visible = true
			$TutorialText.position = Vector2(320, 420)
			$TutorialText.modulate.a = 1
			
			$RightArrow.visible = true
			
			$OmniXV0OmniMusicName.visible = true
			$OmniXV0OmniMusicName.position = Vector2(320, 465)
			$OmniXV0OmniMusicName.modulate.a = 1
			
			$TutorialButton/TutorialButtonMoveIn.play("Tutorial Button Move In")
			
			$TutorialButtonPressed.visible = false
			$TutorialButtonPressed.position = Vector2(320, 240)
			
			tutorialcheckmark.visible = true
			#tutorialcheckmark.position.x = 450
			tutorialcheckmark.modulate.a = 1
			
			$ComingSoonText.visible = true
			$ComingSoonText.position = Vector2(640, 240)
			$ComingSoonText.modulate.a = 0.5
			
			$BackButton.visible = true
			
			if Input.is_key_pressed(KEY_BACKSPACE):
				change_state(State.STATE_1)
				
			if Input.is_key_pressed(KEY_ESCAPE):
				change_state(State.STATE_0)
				
			if Input.is_key_pressed(KEY_RIGHT):
				$LeftArrow.visible = true
				$RightArrow.visible = false
				$OmniXV0Tutorial.position += Vector2(-320, 0)
				$OmniXV0Tutorial.modulate.a = 0.5
	
				$TutorialText.position += Vector2(-320, 0)
				$TutorialText.modulate.a = 0.5
	
				$TutorialButton.rect_position += Vector2(-320, 0)
				$TutorialButton.visible = false
				$TutorialButton/TutorialButtonMoveOut.play("Tutorial Button Move Out")
				
				$OmniXV0OmniMusicName.position += Vector2(-320, 0)
				$OmniXV0OmniMusicName.modulate.a = 0.5
				
				tutorialcheckmark.position += Vector2(-320, 0)
				tutorialcheckmark.modulate.a = 0.5
	
				$ComingSoonText.position += Vector2(-320, 0)
				$ComingSoonText.modulate.a = 1
				
				change_state(State.STATE_4)
				
			if time > TIME_PERIOD:
				$TutorialButton/TutorialButtonMoveIn.play("Tutorial Button Move In")
				emit_signal("timeout")
				print("timeout_1")
				time = 0
				change_state(State.STATE_3)
				
		State.STATE_3:
			$StartButton/StartButtonMoveOut.play("Start Button Move Out")
			
			$OmniLogo.visible = false
			$OmniXV0.visible = false
			$ByText.visible = false
			$PressEnter.visible = false
			$PoweredByGodot.visible = false
			$CopyrightOmniXV0.visible = false
			$OmniVersion.visible = false
			$OmniXV0OmniNihilMusicName.visible = false
			
			$StageSelectText.visible = true
			$OmniXV0Tutorial.visible = true
			$TutorialText.visible = true
			$TutorialButton.visible = true
			$RightArrow.visible = true
			$OmniXV0OmniMusicName.visible = true
			
			$TutorialButtonPressed.visible = false
			
			tutorialcheckmark.visible = true
			#tutorialcheckmark.position.x = 450
			
			$ComingSoonText.visible = true
			$ComingSoonText.modulate.a = 0.5
			
			$BackButton.visible = true
			
			if Input.is_key_pressed(KEY_ENTER):
				set_custom_mouse_cursor_disappear()
				
				$"Omni SFX".play()
				$"OmniXV0 - OmniNihil".stop()
				
				$TutorialButtonPressed.visible = true
				
				$FadeIn.play("Fade In")
				
			if Input.is_key_pressed(KEY_BACKSPACE):
				change_state(State.STATE_1)
				
			if Input.is_key_pressed(KEY_ESCAPE):
				change_state(State.STATE_0)
				
			if Input.is_key_pressed(KEY_RIGHT):
				$LeftArrow.visible = true
				$RightArrow.visible = false
				$OmniXV0Tutorial.position += Vector2(-320, 0)
				$OmniXV0Tutorial.modulate.a = 0.5
	
				$TutorialText.position += Vector2(-320, 0)
				$TutorialText.modulate.a = 0.5
	
				$TutorialButton.rect_position += Vector2(-320, 0)
				$TutorialButton.visible = false
				$TutorialButton/TutorialButtonMoveOut.play("Tutorial Button Move Out")
				
				tutorialcheckmark.position += Vector2(-320, 0)
				tutorialcheckmark.modulate.a = 0.5
				
				$OmniXV0OmniMusicName.position += Vector2(-320, 0)
				$OmniXV0OmniMusicName.modulate.a = 0.5
	
				$ComingSoonText.position += Vector2(-320, 0)
				$ComingSoonText.modulate.a = 1
				
				change_state(State.STATE_4)
		State.STATE_4:
			if Input.is_key_pressed(KEY_ESCAPE):
				change_state(State.STATE_0)
				
			if Input.is_key_pressed(KEY_LEFT):
				$LeftArrow.visible = false
				$RightArrow.visible = true
				$OmniXV0Tutorial.position += Vector2(320, 0)
				$OmniXV0Tutorial.modulate.a = 1
	
				$TutorialText.position += Vector2(320, 0)
				$TutorialText.modulate.a = 1
	
				$TutorialButton.rect_position += Vector2(320, 0)
				$TutorialButton.visible = true
				$TutorialButton/TutorialButtonMoveIn.play("Tutorial Button Move In")
				
				$OmniXV0OmniMusicName.position += Vector2(320, 0)
				$OmniXV0OmniMusicName.modulate.a = 1
				
				tutorialcheckmark.position += Vector2(320, 0)
				tutorialcheckmark.modulate.a = 1
	
				$ComingSoonText.position += Vector2(320, 0)
				$ComingSoonText.modulate.a = 0.5
				
				change_state(State.STATE_3)
				
			if Input.is_key_pressed(KEY_RIGHT):
				$RightArrow.visible = false
				$ComingSoonText.modulate.a = 1
				
			if Input.is_key_pressed(KEY_BACKSPACE):
				change_state(State.STATE_1)

func _on_StartButton_pressed():
	change_state(State.STATE_2)
		
func _on_BackButton_pressed():
	change_state(State.STATE_1)
	
func _on_TutorialButton_pressed():
	set_custom_mouse_cursor_disappear()
	
	$"Omni SFX".play()
	$"OmniXV0 - OmniNihil".stop()
	
	$TutorialButtonPressed.visible = true
	$TutorialButton.visible = false
	
	$FadeIn.play("Fade In")
	
func _on_FadeIn_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Omni.tscn")

func _on_RightArrow_pressed():
	change_state(State.STATE_4)
	
	$LeftArrow.visible = true
	$RightArrow.visible = false
	$OmniXV0Tutorial.position += Vector2(-320, 0)
	$OmniXV0Tutorial.modulate.a = 0.5
	
	$TutorialText.position += Vector2(-320, 0)
	$TutorialText.modulate.a = 0.5
	
	$TutorialButton.rect_position += Vector2(-320, 0)
	$TutorialButton.visible = false
	$TutorialButton/TutorialButtonMoveOut.play("Tutorial Button Move Out")
	
	tutorialcheckmark.position += Vector2(-320, 0)
	tutorialcheckmark.modulate.a = 0.5
	
	$OmniXV0OmniMusicName.position += Vector2(-320, 0)
	$OmniXV0OmniMusicName.modulate.a = 0.5
	
	$ComingSoonText.position += Vector2(-320, 0)
	$ComingSoonText.modulate.a = 1

func _on_LeftArrow_pressed():
	$LeftArrow.visible = false
	$RightArrow.visible = true
	$OmniXV0Tutorial.position += Vector2(320, 0)
	$OmniXV0Tutorial.modulate.a = 1
	
	$TutorialText.position += Vector2(320, 0)
	$TutorialText.modulate.a = 1
	
	$TutorialButton.rect_position += Vector2(320, 0)
	$TutorialButton.visible = true
	$TutorialButton/TutorialButtonMoveIn.play("Tutorial Button Move In")
	
	$OmniXV0OmniMusicName.position += Vector2(320, 0)
	$OmniXV0OmniMusicName.modulate.a = 1
	
	tutorialcheckmark.position += Vector2(320, 0)
	tutorialcheckmark.modulate.a = 1
	
	$ComingSoonText.position += Vector2(320, 0)
	$ComingSoonText.modulate.a = 0.5
	
func change_state(next_state):
	current_state = next_state
	match current_state:
		State.STATE_0:
			print("Changing state to: State.STATE_0")
		State.STATE_1:
			print("Changing state to: State.STATE_1")
		State.STATE_2:
			print("Changing state to: State.STATE_2")
		State.STATE_3:
			print("Changing state to: State.STATE_3")
		State.STATE_4:
			print("Changing state to: State.STATE_4")
