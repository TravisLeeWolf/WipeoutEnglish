extends Control
"""
Displays wipeout animation
"""


func _ready():
	var trigger = get_tree().get_root().find_node("Game", true, false)
	trigger.connect("wipeout", self, "splash")
	$Animation.visible = false
	$MarginCT/Logo.self_modulate = Color.white
	visible = true
	$Timer.start()


func _on_Timer_timeout():
	visible = false


func splash():
	$MarginCT/Logo.self_modulate = Color.crimson
	$Animation.visible = true
	visible = true
	$Timer.wait_time = 1.5
	$WipeoutSound.play()
	$Timer.start()
