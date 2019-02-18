extends KinematicBody2D

const SPEED = 350
const GRAV = 15
const JUMP = 700

var vel = Vector2()

func _ready():
	print (global_position)

func _physics_process(delta):
	#************left right buttons************
	if Input.is_action_pressed('ui_left'):
		vel.x = -SPEED
	elif Input.is_action_pressed('ui_right'):
		vel.x = SPEED
	else:
		vel.x = 0
	
	vel.y += GRAV
	#************jump when on plank************
	if is_on_floor(): #&& Input.is_action_just_pressed('ui_up'):
		vel.y = -JUMP ;
		
	vel = move_and_slide(vel, Vector2(0, -1))
	
	
	#************teleport to another side of screen************
	if position.x < -360:
		position.x = 360
	
	if position.x > 385:
		position.x = -360
	
	#************if player falls from screen************
	if position.y > 480:
		#print ('fail')
		position.x= 0
		position.y= 0
		$"../../".GAME = false
		get_tree().paused = true
		$"../../End_screen".show()
		$"../../Start_screen/ColorRect/StartButton/Start_music".stop()
		$"../../GameMusic".stop()
		$"../../GUI".hide()
		#if ($"../../".score < $"../../".max_score):
			#$"../../".savegame()
