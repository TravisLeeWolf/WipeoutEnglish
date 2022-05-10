extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	$Back.visible = true
	$Front.visible = false
	$Front/Points.text = str(pickRandomPoints())
	var yesPressed = get_tree().get_root().find_node("Game", true, false)
	yesPressed.connect("flipCard", self, "cardFlip")
	

func _on_Timer_timeout():
	$Front.visible = true
	$Back.pressed = false
	$Back.visible = false

func pickRandomPoints():
	randomize()
	var points = ((randi() % 10) + 1) * 5
	var tsunami = rand_range(0, 1)
	if tsunami > (1 - (Globals.difficultyFactor * 0.1)):
		points = "X"
	return points
	
func setTileText(back):
	$Back/Position.text = back

func cardFlip():
	if $Back.pressed == true:
		Globals.currentScore = $Front/Points.text
		$Timer.start()
		$ParticlePop.emitting = true
	
func _on_Back_pressed():
	if $Back.pressed == true:
		$ButtonClick.play()

