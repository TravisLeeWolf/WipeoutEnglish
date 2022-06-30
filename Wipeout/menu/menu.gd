extends Control
"""
The main menu for the game used for setting up the parameters of the game

Sets the grade level for questions to be used in game, the random frequency
of wipeouts (where teams lose all points), the number of teams and extra settings,
such as a random block picker, random student picker and to show the numerical value
of the score.

NOTE: The question set is still a work in progress.
"""

onready var grade_button = preload("res://menu/grade_button.tscn")
onready var grades: Array = Globals.GRADES

var question_set = PicList.pictures.keys()

"""
Adds the buttons to select the grade and assigns name from Global.GRADES
"""
func _ready():
	$MenuMusic.play()
	if LanguageManager.check_language() == "ja":
		$MainCT/VerCT/HeadBox/LanguageButton.pressed = true
	set_language_button()
	setup_menu_text()
	add_question_set_to_options_button()
	update_leftover_text()
	reset_grade_buttons()

"""
Using the process fucntion to update the team number slider if the value if changed
"""
func _process(_delta: float) -> void:
	$MainCT/VerCT/HorCT/TeamCT/NumberSlider.max_value = Globals.number_of_teams
	if Globals.showStudentPicker:
		$ClassSize.popup()
		Globals.showStudentPicker = false
	if $MainCT/VerCT/HorCT/VBoxContainer/QItems.get_item_count() == 0:
		$MainCT/VerCT/HorCT/VBoxContainer/QItems.visible = false
		$MainCT/VerCT/HorCT/VBoxContainer/QSet.select(0)


"""
Sets all the variables for the game layout in the globals.gd script
"""
func _on_Play_pressed():
	$MenuMusic.stop()
	$Clicks.play()
	Globals.block_settings = false
	Globals.NumberOfTeams = $MainCT/VerCT/HorCT/TeamCT/NumberSlider.value
	add_question_items_to_list()
	QP.reset_questions()
	get_tree().change_scene("res://game/game.tscn")


"""
Confirmation message to exit the game
"""
func _on_Quit_pressed():
	$Clicks.play()
	$Confirmation.set_message_text("GAME_EXIT_MESSAGE")
	$Confirmation.popup()


"""
Displays the number of teams to pick when moving the teams slider
"""
func _on_NumberSlider_value_changed(value):
	$Clicks.play()
	if value == 1:
		$MainCT/VerCT/HorCT/TeamCT/Count.text = "1 " + tr("TEAM_TEXT")
	else:
		$MainCT/VerCT/HorCT/TeamCT/Count.text = str(value) + " " + tr("TEAM_TEXT")


"""
Buttons for grid size of the game
NOTE: Can be implemented into it's own class so code doesn't need to be written over again
"""
func _on_FourGrid_pressed():
	$Clicks.play()
	Globals.gridSize = 4
	$MainCT/VerCT/HorCT/TeamCT/GridCT/SixGrid.pressed = false
	$MainCT/VerCT/HorCT/TeamCT/GridCT/EightGrid.pressed = false

func _on_SixGrid_pressed():
	$Clicks.play()
	Globals.gridSize = 6
	$MainCT/VerCT/HorCT/TeamCT/GridCT/FourGrid.pressed = false
	$MainCT/VerCT/HorCT/TeamCT/GridCT/EightGrid.pressed = false	

func _on_EightGrid_pressed():
	$Clicks.play()
	Globals.gridSize = 8
	$MainCT/VerCT/HorCT/TeamCT/GridCT/FourGrid.pressed = false
	$MainCT/VerCT/HorCT/TeamCT/GridCT/SixGrid.pressed = false

"""
Sets the game difficulty when the slider's value is changed
"""
func _on_DiffSlider_value_changed(value):
	$Clicks.play()
	change_difficulty_text(value)
	if value == 0:
		Globals.difficultyFactor = 0
	elif value == 4:
		Globals.difficultyFactor = 5
	else:
		Globals.difficultyFactor = value


"""
As the difficulty slider's value changes, display the level of difficulty
"""	
func change_difficulty_text(level):
	$Clicks.play()
	var colorList = [Color.greenyellow, Color.dodgerblue, Color.white, Color.orange, Color.red]
#	var textList = ["Super Easy!", "Easy", "Normal", "Hard", "CRAZY!"]
	var textList = tr("DIFFICULTY_SETTING_TEXT").split("*")
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.self_modulate = colorList[level]
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.text = textList[level]


"""
Toggles between the language options for display and button text
"""
func _on_LanguageButton_toggled(button_pressed):
	$Clicks.play()
	if button_pressed:
		LanguageManager.update_language("ja")
		Globals.english_on = false
	elif not button_pressed:
		LanguageManager.update_language("en")
		Globals.english_on = true
	update_leftover_text()
	reset_grade_buttons()
	$HowTo.start_from_begining()


func setup_menu_text():
	$MainCT/VerCT/HorCT/VBoxContainer/QSet.set_item_text(0, "QUESTION_SET_BOX")
	$MainCT/VerCT/ButtonCT/Quit/Label.text = "EXIT_BUTTON"
	$MainCT/VerCT/ButtonCT/Play/Label.text = "START_BUTTON"
	$MainCT/VerCT/HorCT/TeamCT/Count.text = "TEAM_TEXT"
	$MainCT/VerCT/ButtonCT/Settings/Label.text = "SETTINGS_BUTTON_TEXT"
	$MainCT/VerCT/HeadBox/HowTo/Text.text = "HOW_TO_BUTTON_TEXT"
	
	
func update_leftover_text():
	var difficultyList = tr("DIFFICULTY_SETTING_TEXT").split("*")
	$MainCT/VerCT/HorCT/TeamCT/Difficulty.text = difficultyList[2]
	Globals.update_grades_text()
	
func set_language_button():
	if Globals.english_on:
		$MainCT/VerCT/HeadBox/LanguageButton.pressed = false
	else:
		$MainCT/VerCT/HeadBox/LanguageButton.pressed = true

func setup_grade_buttons():
	for i in range(9):
		var grade = grade_button.instance()
		grade.set_button_text(grades[i])
		grade.set_button_value(i)
		$MainCT/VerCT/HorCT/Grade.add_child(grade)
		
func reset_grade_buttons():
	for node in $MainCT/VerCT/HorCT/Grade.get_children():
		$MainCT/VerCT/HorCT/Grade.remove_child(node)
		node.queue_free()
	setup_grade_buttons()


"""
Open up dialogue to change settings for the game like button themes
"""
func _on_Settings_pressed():
	$Clicks.play()
	Globals.block_settings = true
	$Settings.add_blocks()
	$Settings.show()
	
	
func add_question_set_to_options_button():
	for i in range(len(question_set)):
		$MainCT/VerCT/HorCT/VBoxContainer/QSet.add_item(question_set[i])


func _on_QSet_item_selected(index):
	$Clicks.play()
	$MainCT/VerCT/HorCT/VBoxContainer/QItems.visible = true
	if index == 0:
		Globals.game_settings["question_set"] = "Daily"
		$MainCT/VerCT/HorCT/VBoxContainer/QSet.pressed = false
	else:
		var questionItem = $MainCT/VerCT/HorCT/VBoxContainer/QSet.get_item_text(index)
		Globals.game_settings["question_set"] = questionItem
		$MainCT/VerCT/HorCT/VBoxContainer/QItems.add_item(questionItem, load("res://assets/gfx/misc/grabber.png"))
		$MainCT/VerCT/HorCT/VBoxContainer/QSet.pressed = true

func _on_QItems_item_selected(index):
	$MainCT/VerCT/HorCT/VBoxContainer/QItems.remove_item(index)
	

func _on_HowTo_pressed():
	$HowTo.visible = true


func add_question_items_to_list():
	if $MainCT/VerCT/HorCT/VBoxContainer/QItems.get_item_count() > 0:
		var item_list = $MainCT/VerCT/HorCT/VBoxContainer/QItems.items
		var list_of_questions = []
		for item in item_list:
			if typeof(item) == TYPE_STRING:
				list_of_questions.append(item)
		Globals.list_of_questions = list_of_questions
	else:
		Globals.list_of_questions = []
