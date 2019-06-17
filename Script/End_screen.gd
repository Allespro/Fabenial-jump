extends Control

func check_network():
	$ColorRect/ShareResult.text = ''
	$"../VersionGet".request("https://globalbit.ru/FabenialJump/HighScore")
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(0.4) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()			# Start it
	yield(t, "timeout")			# Start it
	if ($"../".response == 200):
		$ColorRect/ShareResult.add_color_override("font_color", Color("25ff00"))
		$ColorRect/ShareResult.text = 'Сервер доступен, результат был отправлен'
	else:
		$ColorRect/ShareResult.add_color_override("font_color", Color("ff5900"))
		$ColorRect/ShareResult.text = 'Сервер недоступен, отправка результата невозможна'

func _on_Highscore_pressed():
	self.hide()
	$"../Leaders"._ready()
	$"../Leaders".show()
