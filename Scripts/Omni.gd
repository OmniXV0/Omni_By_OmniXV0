extends Node

signal timeout

var OmniXV0Cursor = load("res://Sprites/OmniXV0 Cursor.png")
var VOlihiNCursor = load("res://Sprites/0VOlihiN Cursor.png")

func set_custom_mouse_cursor_1():
	Input.set_custom_mouse_cursor(OmniXV0Cursor)
	
func set_custom_mouse_cursor_2():
	Input.set_custom_mouse_cursor(VOlihiNCursor)
	
func set_custom_mouse_cursor_disappear():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func set_custom_mouse_cursor_appear():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

const TIME_PERIOD_1 = 21.6
const TIME_PERIOD_2 = 4.8
const TIME_PERIOD_3 = 3.4
const TIME_PERIOD_4 = 1.4
const TIME_PERIOD_5 = 4.8
const TIME_PERIOD_6 = 23.4
const TIME_PERIOD_7 = 0.6

var time = 0

onready var Player = $PlayerBody/Player

onready var sliderbox1: Slider = get_node("SliderBox1")

enum State {
	STATE_1,
	STATE_2,
	STATE_3,
	STATE_4,
	STATE_5,
	STATE_6,
	STATE_7,
	STATE_8,
	STATE_9,
	STATE_10,
	STATE_11,
	STATE_12,
	STATE_13,
	STATE_14,
	STATE_15,
	STATE_16,
	STATE_17,
	STATE_18,
	STATE_19,
	STATE_20,
	STATE_21,
	STATE_22,
	STATE_23,
	STATE_24,
	STATE_25,
	STATE_26,
	STATE_27,
	STATE_28,
	STATE_29,
	STATE_30,
	STATE_31,
	STATE_32,
	STATE_33,
	STATE_34,
	STATE_35,
	STATE_36,
	STATE_37,
	STATE_38,
	STATE_39
}

var current_state = State.STATE_1

func _ready():
	set_custom_mouse_cursor_2()
	set_custom_mouse_cursor_appear()
	
	$PlayerProjectileArea.visible = true
	
	sliderbox1.value = 0

func _on_PlayerDeath_animation_finished(Player_Death):
	get_tree().change_scene("res://Scenes/Omni.tscn")
	$PlayerDefend.play("Player Defend")

func _on_ClickBox1Button_pressed():
	$PlayerDefend.play("Player Defend")
	$ClickBox1.visible = false
	
func _on_ClickBox2Button_pressed():
	$PlayerDucking.play("Player Ducking")
	$ClickBox2.visible = false
	
func _on_ClickBox3Button_pressed():
	$PlayerJump.play("Player Jump")
	$ClickBox3.visible = false
	
func _on_ClickBox4Button_pressed():
	$PlayerDefend.play("Player Defend")
	$ClickBox4.visible = false
	
func _on_ClickBox5Button_pressed():
	$PlayerMoveBack.play("Player Move Back")
	$ClickBox5.visible = false
	
func _on_ClickBox6Button_pressed():
	$PlayerMoveUp.play("Player Move Up")
	$ClickBox6.visible = false
	
func _on_ClickBox7Button_pressed():
	$PlayerMoveDown.play("Player Move Down")
	$ClickBox7.visible = false
	
func _on_ClickBox8Button_pressed():
	$PlayerMoveForward.play("Player Move Forward")
	$ClickBox8.visible = false
	
func _on_ClickBox9Button_pressed():
	$PlayerAttack.play("Player Attack")
	$ClickBox9.visible = false
	
func _on_OmniXV0GiantFireball_body_entered(body):
	if "PlayerBody" in body.name:
		$ProjectileExplosion/OmniXV0GiantFireballExplosionAnimation2.play("OmniXV0 Giant Fireball Explosion Animation 2")
		Global.camera.shake(100, 0.5, 100)
		$PlayerDeath.play("Player Death")
		$PlayerProjectileArea.visible = false
		
func _on_OmniXV0SpikeBall4Area_body_entered(body):
	if "PlayerBody" in body.name:
		$SpikeBall4Explosion.play("Spike Ball 4 Explosion")
		Global.camera.shake(100, 0.5, 100)
		$PlayerDeath.play("Player Death")
		$PlayerProjectileArea.visible = false
		
func _on_OmniXV0Area_body_entered(body):
	if "PlayerBody" in body.name:
		Global.camera.shake(100, 0.5, 100)
		$PlayerDeath.play("Player Death")
		$PlayerProjectileArea.visible = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		$OmniXV0Cursor.visible = false
		$VOlihiNCursor.visible = false

func _process(delta):
	time += delta
	match current_state:
		State.STATE_1:
			if time > TIME_PERIOD_1:
				emit_signal("timeout")
				print("timeout_1")
				time = 0
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_2)
		State.STATE_2:
			if Input.is_key_pressed(KEY_UP):
				$PlayerJump.play("Player Jump")
				change_state(State.STATE_3)
		State.STATE_3:
			if Input.is_key_pressed(KEY_DOWN):
				$PlayerDefend.play("Player Defend")
				change_state(State.STATE_4)
		State.STATE_4:
			if Input.is_key_pressed(KEY_LEFT):
				$PlayerMoveDown.play("Player Move Down")
				change_state(State.STATE_5)
		State.STATE_5:
			if Input.is_key_pressed(KEY_RIGHT):
				$PlayerMoveUp.play("Player Move Up")
				change_state(State.STATE_6)
		State.STATE_6:
			if Input.is_key_pressed(KEY_DOWN):
				$PlayerMoveBack2.play("Player Move Back 2")
				change_state(State.STATE_7)
		State.STATE_7:
			if time > TIME_PERIOD_2:
				emit_signal("timeout")
				print("timeout_2")
				time = 0
				Global.camera.shake(100, 0.5, 100)
			if Input.is_key_pressed(KEY_RIGHT):
				$PlayerMoveForward.play("Player Move Forward")
				change_state(State.STATE_8)
		State.STATE_8:
			if Input.is_key_pressed(KEY_LEFT):
				$PlayerMoveBack.play("Player Move Back")
				change_state(State.STATE_9)
		State.STATE_9:
			if Input.is_key_pressed(KEY_UP):
				$PlayerMoveForward2.play("Player Move Forward 2")
				change_state(State.STATE_10)
		State.STATE_10:
			if time > TIME_PERIOD_3:
				emit_signal("timeout")
				print("timeout_3")
				time = 0
				$OmniXV0GiantFireballArea/OmniXV0GiantFireballExplosion/OmniXV0GiantFireballExplosionMove.play("OmniXV0 Giant Fireball Explosion Move")
			if Input.is_key_pressed(KEY_RIGHT):
				$PlayerFireProjectile.play("Player Fire Projectile")
				$OmniXV0GiantFireballArea/OmniXV0GiantFireballExplosion/OmniXV0GiantFireballExplosionMove.stop(false)
				$OmniXV0GiantFireballArea/OmniXV0GiantFireballExplosion/OmniXV0GiantFireballExplosionAnimation.play("OmniXV0 Giant Fireball Explosion Animation")
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_11)
		State.STATE_11:
			if Input.is_key_pressed(KEY_UP):
				$PlayerDefend.play("Player Defend")
				change_state(State.STATE_12)
		State.STATE_12:
			if time > TIME_PERIOD_4:
				emit_signal("timeout")
				print("timeout_4")
				time = 0
				Global.camera.shake(100, 0.5, 100)
			if Input.is_key_pressed(KEY_DOWN):
				$PlayerDucking.play("Player Ducking")
				change_state(State.STATE_13)
		State.STATE_13:
			if Input.is_key_pressed(KEY_RIGHT):
				$PlayerMoveUp.play("Player Move Up")
				change_state(State.STATE_14)
		State.STATE_14:
			if Input.is_key_pressed(KEY_LEFT):
				$PlayerMoveDown.play("Player Move Down")
				change_state(State.STATE_15)
		State.STATE_15:
			if Input.is_key_pressed(KEY_UP):
				$PlayerMoveForward2.play("Player Move Forward 2")
				change_state(State.STATE_16)
		State.STATE_16:
			if time > TIME_PERIOD_5:
				emit_signal("timeout")
				print("timeout_5")
				time = 0
				Global.camera.shake(100, 0.5, 100)
			if Input.is_key_pressed(KEY_LEFT):
				$PlayerMoveBack.play("Player Move Back")
				change_state(State.STATE_17)
		State.STATE_17:
			if Input.is_key_pressed(KEY_RIGHT):
				$PlayerMoveForward.play("Player Move Forward")
				change_state(State.STATE_18)
		State.STATE_18:
			if Input.is_key_pressed(KEY_DOWN):
				$PlayerMoveBack2.play("Player Move Back 2")
				change_state(State.STATE_19)
		State.STATE_19:
			if Input.is_key_pressed(KEY_RIGHT):
				$PlayerFireProjectile2.play("Player Fire Projectile 2")
				$PlayerDefend.play("Player Defend")
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_20)
		State.STATE_20:
			if time > TIME_PERIOD_6:
				emit_signal("timeout")
				print("timeout_6")
				time = 0
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_21)
		State.STATE_21:
			if time > TIME_PERIOD_7:
				emit_signal("timeout")
				print("timeout_7")
				time = 0
				Global.camera.shake(100, 0.5, 100)
			if Input.is_key_pressed(KEY_O):
				$PlayerJump.play("Player Jump")
				change_state(State.STATE_23)
		State.STATE_23:
			if Input.is_key_pressed(KEY_X):
				$PlayerMoveBack2.play("Player Move Back 2")
				change_state(State.STATE_24)
		State.STATE_24:
			if Input.is_key_pressed(KEY_V):
				$PlayerMoveUp.play("Player Move Up")
				change_state(State.STATE_25)
		State.STATE_25:
			if Input.is_key_pressed(KEY_0):
				$PlayerMoveDown.play("Player Move Down")
				change_state(State.STATE_26)
		State.STATE_26:
			if Input.is_key_pressed(KEY_SPACE):
				$PlayerSwingSword2.play("Player Swing Sword 2")
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_27)
		State.STATE_27:
			if Input.is_key_pressed(KEY_I):
				$PlayerMoveForward.play("Player Move Forward")
				change_state(State.STATE_28)
		State.STATE_28:
			if Input.is_key_pressed(KEY_S):
				$PlayerMoveBack.play("Player Move Back")
				change_state(State.STATE_29)
		State.STATE_29:
			if Input.is_key_pressed(KEY_BACKSPACE):
				$PlayerDucking.play("Player Ducking")
				change_state(State.STATE_30)
		State.STATE_30:
			if Input.is_key_pressed(KEY_ENTER):
				$PlayerDefend.play("Player Defend")
				$PlayerFireBlast.play("Player Fire Blast")
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_31)
		State.STATE_31:
			if Input.is_key_pressed(KEY_O):
				$PlayerDefend.play("Player Defend")
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_32)
		State.STATE_32:
			if Input.is_key_pressed(KEY_M):
				$PlayerMoveForward2.play("Player Move Forward 2")
				change_state(State.STATE_33)
		State.STATE_33:
			if Input.is_key_pressed(KEY_N):
				$PlayerMoveDown.play("Player Move Down")
				change_state(State.STATE_34)
		State.STATE_34:
			if Input.is_key_pressed(KEY_I):
				$PlayerMoveUp.play("Player Move Up")
				change_state(State.STATE_35)
		State.STATE_35:
			if Input.is_key_pressed(KEY_SPACE):
				$PlayerSwingSword2.play("Player Swing Sword 2")
				Global.camera.shake(100, 0.5, 100)
				change_state(State.STATE_36)
		State.STATE_36:
			if Input.is_key_pressed(KEY_I):
				$PlayerMoveBack.play("Player Move Back")
				change_state(State.STATE_37)
		State.STATE_37:
			if Input.is_key_pressed(KEY_S):
				$PlayerMoveForward.play("Player Move Forward")
				change_state(State.STATE_38)
		State.STATE_38:
			if Input.is_key_pressed(KEY_BACKSPACE):
				$PlayerJump.play("Player Jump")
				change_state(State.STATE_39)
		State.STATE_39:
			if Input.is_key_pressed(KEY_ENTER):
				$PlayerFireBlast2.play("Player Fire Blast 2")
				Global.camera.shake(100, 0.5, 300)
				KeyHold()

func KeyHold():
	if !Input.is_key_pressed(KEY_ENTER):
		return
	yield(get_tree().create_timer(0.3), "timeout")
	if !Input.is_key_pressed(KEY_ENTER):
		return
	$PlayerFireBlast2/OmniXV0CollisionMove.play("OmniXV0 Collision Move")

func _on_SliderBox1_value_changed(value):
	$PlayerDefend2.play("Player Defend 2")
	
func _on_SliderBox2_value_changed(value):
	$PlayerSlide.play("Player Slide")
	
func _on_SliderBox3_value_changed(value):
	$PlayerMoveUpAndDown.play("Player Move Up And Down")
	
func _on_SliderBox4_value_changed(value):
	$PlayerSwingSword.play("Player Swing Sword")
	$SpikeBall4Deflect.play("Spike Ball 4 Deflect")
	
func _on_SliderBox5_value_changed(value):
	$PlayerDefend2.play("Player Defend 2")
	
func _on_SliderBox6_value_changed(value):
	$PlayerMoveDownAndUp.play("Player Move Down And Up")
	
func _on_SliderBox7_value_changed(value):
	$PlayerFly.play("Player Fly")
	
func _on_SliderBox8_value_changed(value):
	$PlayerFlyAttack.play("Player Fly Attack")
	
func _on_ClickBox26Button_pressed():
	$PlayerAttack2.play("Player Attack 2")

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.STATE_1:
			print("Changing state to: State.STATE_1")
		State.STATE_2:
			print("Changing state to: State.STATE_2")
		State.STATE_3:
			print("Changing state to: State.STATE_3")
		State.STATE_4:
			print("Changing state to: State.STATE_4")
		State.STATE_5:
			print("Changing state to: State.STATE_5")
		State.STATE_6:
			print("Changing state to: State.STATE_6")
		State.STATE_7:
			print("Changing state to: State.STATE_7")
		State.STATE_8:
			print("Changing state to: State.STATE_8")
		State.STATE_9:
			print("Changing state to: State.STATE_9")
		State.STATE_10:
			print("Changing state to: State.STATE_10")
		State.STATE_11:
			print("Changing state to: State.STATE_11")
		State.STATE_12:
			print("Changing state to: State.STATE_12")
		State.STATE_13:
			print("Changing state to: State.STATE_13")
		State.STATE_14:
			print("Changing state to: State.STATE_14")
		State.STATE_15:
			print("Changing state to: State.STATE_15")
		State.STATE_16:
			print("Changing state to: State.STATE_16")
		State.STATE_17:
			print("Changing state to: State.STATE_17")
		State.STATE_18:
			print("Changing state to: State.STATE_18")
		State.STATE_19:
			print("Changing state to: State.STATE_19")
		State.STATE_20:
			print("Changing state to: State.STATE_20")
		State.STATE_21:
			print("Changing state to: State.STATE_21")
		State.STATE_22:
			print("Changing state to: State.STATE_22")
		State.STATE_23:
			print("Changing state to: State.STATE_23")
		State.STATE_24:
			print("Changing state to: State.STATE_24")
		State.STATE_25:
			print("Changing state to: State.STATE_25")
		State.STATE_26:
			print("Changing state to: State.STATE_26")
		State.STATE_27:
			print("Changing state to: State.STATE_27")
		State.STATE_28:
			print("Changing state to: State.STATE_28")
		State.STATE_29:
			print("Changing state to: State.STATE_29")
		State.STATE_30:
			print("Changing state to: State.STATE_30")
		State.STATE_31:
			print("Changing state to: State.STATE_31")
		State.STATE_32:
			print("Changing state to: State.STATE_32")
		State.STATE_33:
			print("Changing state to: State.STATE_33")
		State.STATE_34:
			print("Changing state to: State.STATE_34")
		State.STATE_35:
			print("Changing state to: State.STATE_35")
		State.STATE_36:
			print("Changing state to: State.STATE_36")
		State.STATE_37:
			print("Changing state to: State.STATE_37")
		State.STATE_38:
			print("Changing state to: State.STATE_38")
		State.STATE_39:
			print("Changing state to: State.STATE_39")
			
func TutorialComplete():
	Global.level = 2
	emit_signal("Tutorial Complete")
	print("Tutorial Complete")

func _on_TutorialAnimation_animation_finished(anim_name):
	TutorialComplete()
	Global.screen = 2
	set_custom_mouse_cursor_2()
	$FadeIn.play("Fade In")

func _on_FadeIn_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
