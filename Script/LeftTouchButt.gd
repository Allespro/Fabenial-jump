extends TextureButton

func _physics_process(delta):
	if($"../../../".GAME == false):
		Input.action_release("ui_left")

func _on_LeftButt_button_down():
	Input.action_press("ui_left")

func _on_LeftButt_button_up():
	Input.action_release("ui_left")