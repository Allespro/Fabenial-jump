extends KinematicBody2D

var SPEED = 3.5

var SPEED_LEVEL = 100

func _physics_process(delta):
	position.y += SPEED
	if $"../../".score > SPEED_LEVEL:
		SPEED += 0.05
		SPEED_LEVEL += 100
	
	if position.y > 1281:
		print('del')
		queue_free()
	if $"../../".score > 32:
		$AnimatedSprite.play()
	
	pass
