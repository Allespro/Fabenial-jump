# JUST A STRAT SCREEN WITH A LOADING VIDEO
# REMOVED IN NEW VERSION!!!
extends VideoPlayer

var STATUS

func _ready():
	play()
	pass
	
func _physics_process(delta):
	STATUS = is_playing()
	if STATUS == false:
		$"../../".hide()

