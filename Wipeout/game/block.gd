extends Control
"""
Blocks are buttons that show it's grid text and randomly assigns a score or wipeout
to each for the team to flip over
"""

var COLORS = [
	Color.darkorange,
	Color.deepskyblue,
	Color.gold,
	Color.limegreen,
	Color.hotpink,
	Color.darkorchid,
	Color.crimson,
	]
var colors = []
var picture_set = []
var pictures = []

var myColor

func _ready():
	assign_picture_set()
	$Back.visible = true
	$Front.visible = false
	$Front/Points.text = str(pickRandomPoints())
	if Globals.block_settings == false:
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
		$ParticlePop.process_material.color = myColor
		$ParticlePop.emitting = true
		
func pick_random_block_color():
	if colors == []:
		colors = [] + COLORS
	randomize()
	var color = randi() % len(colors)
	$Back.self_modulate = colors[color]
	myColor = colors[color]
	colors.remove(color)
	
func add_random_picture():
	if pictures == []:
		pictures = [] + picture_set
	randomize()
	var choice = randi() % len(pictures)
	var picture = load(pictures[choice])
	$Back/Picture.texture = picture
	pictures.remove(choice)
	
		
func assign_picture_set():
	if Globals.block_settings:
		if Globals.block_is_alphanumeric == true:
			set_random_color()
		elif Globals.block_is_alphanumeric == false:
			add_random_picture()
		if Globals.block_is_rainbow == true:
			pick_random_block_color()
		elif Globals.block_is_rainbow == false:
			set_random_color()
	elif Globals.block_settings == false:
		if Globals.block_style["rainbow"]:
			pick_random_block_color()
		else:
			set_random_color()
		if not Globals.block_style["pictures"] == "none":
			$Back/Position.visible = false
			picture_set = PicList.pictures[Globals.block_style["pictures"]]
			add_random_picture()
		else:
			$Back/Position.visible = true
	else:
		set_random_color()


func set_random_color():	
	if Globals.blockColor == Color.white:
		var color = randi() % len(COLORS)
		Globals.blockColor = COLORS[color]
	myColor = Globals.blockColor
	$Back.self_modulate = myColor
	
	
func setup_pictures():
	add_random_picture()
	pick_random_block_color()
