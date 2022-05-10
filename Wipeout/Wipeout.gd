extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var trigger = get_tree().get_root().find_node("Game", true, false)
	trigger.connect("wipeout", self, "splash")
	$Animation.visible = false
	$MarginCT/Logo.self_modulate = Color.white
	visible = true
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func splash():
	$MarginCT/Logo.self_modulate = Color.crimson
	$Animation.visible = true
	visible = true
	$Timer.wait_time = 1.5
	$WipeoutSound.play()
	$Timer.start()

func _on_Timer_timeout():
	visible = false
