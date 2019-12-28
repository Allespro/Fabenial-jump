extends Control

func check_network():
	$ColorRect/ShareResult.text = ''
	
	$"../VersionGet".request($"../".server_addres + "HighScore")
	var t = Timer.new() 
	t.set_wait_time(0.4) 
	add_child(t)
	t.start()	
	yield(t, "timeout")	
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
