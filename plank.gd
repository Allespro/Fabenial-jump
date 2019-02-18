extends KinematicBody2D

var SPEED = 3.5

#var SPEED_LEVEL = 80

func _physics_process(delta):
	#************Falling Down ((((( xxx&lil(((((************
	position.y += SPEED
	#if $"../../".score > SPEED_LEVEL:
	#	SPEED += 0.05
	#	SPEED_LEVEL += 70
	#************del if player don't see plank************
	if position.y > 1281:
		#print('del')
		queue_free()
	#************blink************
	if $"../../".score > 32:
		$AnimatedSprite.play()
	
	pass
