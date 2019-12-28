extends Node2D

var trans = Vector2(0.1, 0.1)

func _physics_process(delta):
	$Sprite.scale += trans
	if ($Sprite.scale.x > 3):
		trans = -trans
	if ($Sprite.scale.x < 2):
		trans = -trans
	position.y += 1.3
	if position.y > 1281:
		queue_free()

func _on_HealthArea_area_entered(area):
	var groups = area.get_groups()
	if(groups.has("player") && $"../../Player/PlayerBody".need_health == true):
		queue_free()