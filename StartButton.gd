# START BUTTON SCRIPT
extends TextureButton

var arrpos = 0

func _on_StartButton_pressed():
	
	
	
	
	$"../../".hide()
	$"../../../GUI".show()
	get_tree().paused = false
	$Start_music/StartSound.play('soundstart')




