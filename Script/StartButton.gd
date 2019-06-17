extends TextureButton

var arrpos = 0
var time = 0

func _on_StartButton_pressed():
	time = 0
	$"../".hide()
	$"../../GUI".show()
	$"../../GUI/TouchScreen/TouchHintLeft".play()
	$"../../GUI/TouchScreen/TouchHintRight".play()
	#$"../../GUI/TouchHintLeft".stop()
	#$"../../GUI/TouchHintRight".stop()
	get_tree().paused = false
	$Start_music/StartSound.play('soundstart')