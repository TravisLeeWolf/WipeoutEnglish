extends Control
"""
The main menu for the game used for setting up the parameters of the game

Sets the grade level for questions to be used in game, the random frequency
of wipeouts (where teams lose all points), the number of teams and extra settings,
such as a random block picker, random student picker and to show the numerical value
of the score.

NOTE: The question set is still a work in progress.
"""

# Message sent out becuase question maker is not functional as yet
signal question_maker_message_sent

onready var grade_button = preload("res://menu/grade_button.tscn")


"""Adds the buttons to select the grade and assigns name from Global.GRADES"""
func _ready():
	for i in range(len(Globals.GRADES)):
		var grade = grade_button.instance()
		grade.setButtonText(Globals.GRADES[i])
		$MainCT/VerCT/HorCT/Grade.add_child(grade)

"""Sets all the variables for the game layout in the globals.gd script"""
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
	if not $MainCT/VerCT/HorCT/VBoxContainer/OptionsCT/PickStudents.pressed:
		Globals.pickStudents = false
	get_tree().change_scene("res://game/game.tscn")


func _on_Quit_pressed():
	$Confirmation.set_message_text("Are you sure you want to exit the game?")
	$Confirmation.popup()


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


func _on_PickStudents_pressed():
	$ClassSize.popup()

	
func change_difficulty_text(level):
	var colorList = [Color.greenyellow, Color.dodgerblue, Color.white, Color.orange, Color.red]
	var textList = ["Super Easy!", "Easy", "Normal", "Hard", "CRAZY!"]
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.self_modulate = colorList[level]
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.text = textList[level]
