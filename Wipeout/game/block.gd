extends Control
"""
Blocks are buttons that show it's grid text and randomly assigns a score or wipeout
to each for the team to flip over
"""


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


func _on_Back_pressed():
	if $Back.pressed == true:
		$ButtonClick.play()


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
	


