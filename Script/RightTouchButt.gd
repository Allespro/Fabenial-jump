extends TextureButton

func _physics_process(delta):
	if($"../../../".GAME == false):
		Input.action_release("ui_right")

func _on_RightButt_button_down():
	Input.action_press("ui_right")

func _on_RightButt_button_up():
	Input.action_release("ui_right")