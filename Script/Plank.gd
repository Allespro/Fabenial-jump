extends KinematicBody2D

var SPEED = 3
var SPEED_LEVEL = 3
var JUMPER_CAN = false
var CAN_JUMPER_CAN = true
var OBJ_UNHIDE
var HAS_PLAYER = false

func _physics_process(delta):
	position.y += SPEED
	
	if $"../../".score > SPEED_LEVEL:
		SPEED += 0.0005
		SPEED_LEVEL += 1
	if position.y > 1281:
		queue_free()
	if $"../../".score_time > 32:
		$AnimatedSprite.play()
		JUMPER_CAN = true
		
		if(JUMPER_CAN == true && CAN_JUMPER_CAN == true && delta > 0.01):
			randomize()
			OBJ_UNHIDE = rand_range(0, 15)
			OBJ_UNHIDE = round(OBJ_UNHIDE)
			CAN_JUMPER_CAN = false
			if (OBJ_UNHIDE == 0):
				$Jumper.show()
				$Jumper/Area2D.add_to_group("jumper")
			if (OBJ_UNHIDE == 1):
				$Illuminati.show()
				$Illuminati/Sprite/KillArea.add_to_group("bad")
		


func _on_Area2D_area_entered(area):
	var groups = area.get_groups()
	if (groups.has("player")):
		HAS_PLAYER = true
	else:
		HAS_PLAYER = false
	if ($"../../Player/PlayerBody".is_on_floor()):
		$"../../".score = $"../../".score + 1
		
	
