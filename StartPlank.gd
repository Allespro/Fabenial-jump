extends StaticBody2D

var timer = 0

func _physics_process(delta):
	timer += delta
	position.y += delta * 25
	if timer > 7:
		global_position.x=1000
		global_position.y=1000
	