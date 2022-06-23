extends Control
"""
Team score keeper using TextureProgress to display score as it's added as well
as optional numberical score counter
"""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var teamNumber
var myColor
var myScore = 0
var pointsToAdd
var counter

signal changeListColor

# Called when the node enters the scene tree for the first time.
func _ready():
	var teamChoice = get_tree().get_root().find_node("Game", true, false)
	teamChoice.connect("teamSelected", self, "teamSelect")
	
	var addScore = get_tree().get_root().find_node("Game", true, false)
	addScore.connect("givePoints", self, "addToScore")
	
	var revertScore = get_tree().get_root().find_node("Game", true, false)
	revertScore.connect("revertScore", self, "revert_score")
	
	if Globals.showPoints:
		$Container/ProgressBar/Score.visible = true
	else:
		$Container/ProgressBar/Score.visible = false

func _process(_delta):
	$Container/ProgressBar.value = myScore
	$Container/ProgressBar/Score.text = str(myScore)
	$Container/ProgressBar.max_value = Globals.teamMaxValue
	if (Globals.teamMaxValue - myScore) < 20:
		Globals.teamMaxValue = Globals.teamMaxValue + 75

func setTeam(number):
	var color_number = number
	if number >= 6:
		color_number = (randi() % 6) - 1
	var colors = [Color.coral, Color.mediumslateblue, Color.gold, Color.greenyellow, Color.hotpink, Color.darkorchid]
	$Container/TeamColor.color = colors[color_number]
	myColor = $Container/TeamColor.color
	teamNumber = number
	$Container/TeamColor/Name.text = tr("TEAM_BANNER_TEXT") + " " + str(number + 1)
	$Container/ProgressBar.self_modulate = myColor
	# color for progressbar
	
func teamSelect(number):
	if teamNumber == number - 1:
		$Container/TeamColor.color = Color.black
		$Container/TeamColor/Name.add_color_override("font_color", Color.white)
		emit_signal("changeListColor", myColor)
	else:
		$Container/TeamColor.color = myColor
		$Container/TeamColor/Name.add_color_override("font_color", Color.black)

func addToScore():
	var points = Globals.currentScore
	var number = Globals.currentTeam
	if points == null:
		pass
	elif points == "X":
		myScore = 0
		Globals.teamMaxValue = 100
	else:
		if number - 1 == teamNumber:
			var addPoints = int(points)
			if addPoints != 0:
				$Timer.set_wait_time(1 / float(addPoints))
				counter = 1
				pointsToAdd = addPoints
				$ScoreSound.pitch_scale = 0.5
				$Timer.start()
				

func _on_Timer_timeout():
	myScore = myScore + 1
	$ScoreSound.play()
	if counter < pointsToAdd:
		counter = counter + 1
		$ScoreSound.pitch_scale = $ScoreSound.pitch_scale + 0.02
		$Timer.start()

func revert_score():
	if teamNumber == Globals.currentTeam - 1:
		myScore = myScore - int(Globals.currentScore)
