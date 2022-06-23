extends Popup
"""
Popup box to set the class size for picking students by student number with option
for a gap if girl's/boy's student numbers start out of the normal order
"""

var classSize
var startGap
var stopGap
var classNumberList

var gapSettingsActive = false

func _ready():
	reset_gap_settings()
	setup_label_text()


"""
Displays the last student number and adjusts the gap sliders value accordingly
"""
func _on_ClassSize_value_changed(value):
	$Clicks.play()
	classSize = value
	$MarginContainer/VBoxContainer/Label.text = str(value) + " " + tr("LAST_STUDENT_NUMBER")
	$MarginContainer/VBoxContainer/GapSettings/StartGap/StartGap.max_value = classSize
	$MarginContainer/VBoxContainer/GapSettings/StopGap/StopGap.max_value = classSize
	$MarginContainer/VBoxContainer/GapSettings/StopGap/StopGap.value = classSize

	
"""
Sets and displays the start gap value (This is the first student number to ignore)
"""
func _on_StartGap_value_changed(value):
	$Clicks.play()
	startGap = value
	$MarginContainer/VBoxContainer/GapSettings/StartGap/Label.text = str(value)


"""
Sets and displays the stop gap value (This is the last student number to ignore)
"""
func _on_StopGap_value_changed(value):
	$Clicks.play()
	stopGap = value
	$MarginContainer/VBoxContainer/GapSettings/StopGap/Label.text = str(value)


"""
Calls the list maker and sets the game setting to true for picking students at random
"""
func _on_Okay_pressed():
	$Clicks.play()
	make_class_number_list()
	Globals.pickStudents = true
	hide()


"""
Calls the function not display gap sliders and set the game setting to false for picking students at random
"""
func _on_Back_pressed():
	$Clicks.play()
	reset_gap_settings()
	Globals.pickStudents = false
	hide()


"""
Displays the extra settings to pick the gap to ingore
"""
func _on_SetGap_pressed():
	$Clicks.play()
	show_gap_settings()

	
"""
Takes the input vaules and creates the list of student numbers to choose from
and skips the gap of student numbers if any
"""	
func make_class_number_list():
	classNumberList = []
	if gapSettingsActive:
		for i in range(classSize + 1):
			if i == 0:
				continue
			elif i >= startGap and i <= stopGap:
				continue
			else:
				classNumberList.append(i)
	else:
		for i in range(classSize + 1):
			if i == 0:
				continue
			else:
				classNumberList.append(i)
	Globals.studentNumberList = [] + classNumberList


"""
Displays the gap sliders and sets gap variable to true for use when making the list
"""
func show_gap_settings():
	gapSettingsActive = true
	$MarginContainer/VBoxContainer/GapButtonCT.visible = false
	$MarginContainer/VBoxContainer/GapSettings.visible = true


"""
Turns off the gap sliders and sets the gap variable to false so there's no gap added to the list
"""
func reset_gap_settings():
	gapSettingsActive = false
	$MarginContainer/VBoxContainer/GapButtonCT.visible = true
	$MarginContainer/VBoxContainer/GapSettings.visible = false

func setup_label_text():
	$MarginContainer/VBoxContainer/Label.text = "PICK_CLASS_SIZE"
	$MarginContainer/VBoxContainer/GapButtonCT/Label.text = "ADD_GAP"
	$MarginContainer/VBoxContainer/GapSettings/GapLabel.text = "GAP_SKIP_TEXT"
	$MarginContainer/VBoxContainer/GapSettings/StartGap/Label.text = "GAP_START"
	$MarginContainer/VBoxContainer/GapSettings/StopGap/Label.text = "GAP_END"
