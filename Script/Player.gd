extends KinematicBody2D

const SPEED = 350
const GRAV = 15
var JUMP = 700
var FLOOR = false
var LIFES = 4
var randplay
var need_health = false

var protected = false
var protcettimer = 0
var life = true
var transparent = 1
var vel = Vector2()

func _ready():
	$"../../End_screen/ColorRect/ShareResult".text = ''
	$"../../".response = 0
	print (global_position.x)
	$"../../GUI/Health".set_value(LIFES)
	if (LIFES != 4):
		need_health = true

func _physics_process(delta):
	if (LIFES == 4):
		need_health = false
	if (Input.is_action_pressed('ui_left') && Input.is_action_pressed('ui_right')):
		vel.x = 0
	elif Input.is_action_pressed('ui_left'):
		vel.x = -SPEED
	elif Input.is_action_pressed('ui_right'):
		vel.x = SPEED
	else:
		vel.x = 0
	vel.y += GRAV
	if is_on_floor():
		vel.y = -JUMP;
		JUMP = 700
		$"../../".on_floor = true
	else:
		$"../../".on_floor = false
		
	vel = move_and_slide(vel, Vector2(0, -1))
	FLOOR = false
	
	if position.x < -385:
		position.x = 385
	
	if position.x > 385:
		position.x = -360
	
	
	if (position.y > 480 || LIFES == 0):
		#print ('fail')
		$"../../End_screen".check_network()
		$"../../".send_score($"../../".playername, $"../../".score)
		LIFES = 4
		$"../../GUI/Health".set_value(LIFES)
		if($"../../".AnimRecord == true):
			$"../../End_screen/ColorRect/Record".show()
		if($"../../".AnimRecord == false):
			$"../../End_screen/ColorRect/Record".hide()
		position.x= 0
		position.y= 0
		$"../../".GAME = false
		get_tree().paused = true
		$"../../End_screen".show()
		$"../../Start_screen/StartButton/Start_music".stop()
		$"../../GameMusic".stop()
		$"../../GUI".hide()
	
	if (protected == true):
		protcettimer += delta
		if(transparent > 0.5):
			transparent -= delta
			$Sprite.modulate = Color(1, 1, 1, transparent)
	if (protcettimer > 4 && protected == true):
		protcettimer = 0
		protected = false
	if(protected == false && transparent < 1):
		transparent += delta
		$Sprite.modulate = Color(1, 1, 1, transparent)

func _on_JumpArea2D_area_entered(area):
	var groups = area.get_groups()
	if(groups.has("jumper")):
		JUMP = 1000
		$Audio/BlobPlay.play("Blob")
	#if (groups.has("")):
	#	$"../../".score = $"../../".score + 1

func _on_PlayerArea2D_area_entered(area):
	var getgroups = area.get_groups()
	if(getgroups.has("bad") && protected == false):
		need_health = true
		LIFES -= 1
		$"../../GUI/Health".set_value(LIFES)
		protected = true
		randomize()
		randplay = rand_range(0, 1)
		randplay = round(randplay)
		if(randplay == 0):
			$Audio/OuchPlay.play("Ouch1")
		else:
			$Audio/OuchPlay.play("Ouch2")
	if(getgroups.has("health")):
		LIFES += 1
		if (LIFES > 4):
			need_health = false
			LIFES = 4
		$"../../GUI/Health".set_value(LIFES)