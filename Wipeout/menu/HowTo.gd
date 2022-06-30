extends TextureButton

var blinked = false

func _ready():
	self_modulate = Globals.MY_ORANGE
	blink()
	
func blink():
	blinked = true
	self_modulate = Globals.MY_PURPLE
	$BlinkTimer.start()

func _on_BlinkTimer_timeout():
	if blinked:
		blinked = false
		self_modulate = Globals.MY_ORANGE
		$BlinkTimer.start()
	else:
		blink()
