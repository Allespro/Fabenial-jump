extends StaticBody2D

var timer = 0

#var mytexture = preload("res://icon.png")

func _physics_process(delta):
	timer += delta
	position.y += delta * 20
	if timer > 9:
		global_position.x=1000
		global_position.y=1000
	if timer > 4:
		#$Sprite.set_texture(mytexture)
		$"../GUI/TouchScreen/TouchHintLeft".stop()
		$"../GUI/TouchScreen/TouchHintRight".stop()
		$"../GUI/TouchScreen/TouchHintLeft".hide()
		$"../GUI/TouchScreen/TouchHintRight".hide()
		