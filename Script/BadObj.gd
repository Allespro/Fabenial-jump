extends Sprite

var SPEED = 17

func _physics_process(delta):
	position.x += delta * SPEED
	if (position.x > 14):
		SPEED = -SPEED
	if (position.x < -14):
		SPEED = -SPEED
	