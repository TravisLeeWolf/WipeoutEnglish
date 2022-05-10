extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var GRADES = ["ES 1st", "ES 2nd", "ES 3rd", "ES 4th", "ES 5th", "ES 6th", "JHS 1st", "JHS 2nd", "JHS 3rd"]

onready var gradeBTN = preload("res://GradeBTN.tscn")

signal makerPopup

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(len(GRADES)):
		var g = gradeBTN.instance()
		g.setButtonText(GRADES[i])
		$MainCT/VerCT/HorCT/Grade.add_child(g)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quit_pressed():
	$Confirmation.set_message_text("Are you sure you want to exit the game?")
	$Confirmation.popup()


func _on_Play_pressed():
	Globals.NumberOfTeams = $MainCT/VerCT/HorCT/TeamCT/NumberSlider.value
	QP.reset_questions()
	# Check if show points is pressed and set global for the game
	if $MainCT/VerCT/HorCT/VBoxContainer/OptionsCT/ShowPts.pressed:
		Globals.showPoints = true
	else:
		Globals.showPoints = false
	# Check if choose random is pressed and show pick random button in game
	if $MainCT/VerCT/HorCT/VBoxContainer/OptionsCT/ChooseRandom.pressed:
		Globals.showPickBlock = true
	else:
		Globals.showPickBlock = false
	get_tree().change_scene("res://Game.tscn")




func _on_NumberSlider_value_changed(value):
	if value == 1:
		$MainCT/VerCT/HorCT/TeamCT/Count.text = "1 Team"
	else:
		$MainCT/VerCT/HorCT/TeamCT/Count.text = str(value) + " Teams"


func _on_Maker_pressed():
	emit_signal("makerPopup")
	# Remove comment when question maker is functional
#	get_tree().change_scene("res://QuestionMaker.tscn")


func _on_FourGrid_pressed():
	Globals.gridSize = 4
	$MainCT/VerCT/HorCT/TeamCT/GridCT/SixGrid.pressed = false
	$MainCT/VerCT/HorCT/TeamCT/GridCT/EightGrid.pressed = false

func _on_SixGrid_pressed():
	Globals.gridSize = 6
	$MainCT/VerCT/HorCT/TeamCT/GridCT/FourGrid.pressed = false
	$MainCT/VerCT/HorCT/TeamCT/GridCT/EightGrid.pressed = false	

func _on_EightGrid_pressed():
	Globals.gridSize = 8
	$MainCT/VerCT/HorCT/TeamCT/GridCT/FourGrid.pressed = false
	$MainCT/VerCT/HorCT/TeamCT/GridCT/SixGrid.pressed = false


func _on_DiffSlider_value_changed(value):
	change_difficulty_text(value)
	if value == 0:
		Globals.difficultyFactor = 0
	elif value == 4:
		Globals.difficultyFactor = 5
	else:
		Globals.difficultyFactor = value
		
func change_difficulty_text(level):
	var colorList = [Color.greenyellow, Color.dodgerblue, Color.white, Color.orange, Color.red]
	var textList = ["Super Easy!", "Easy", "Normal", "Hard", "CRAZY!"]
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.self_modulate = colorList[level]
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.text = textList[level]

