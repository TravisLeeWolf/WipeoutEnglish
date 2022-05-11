extends Popup


var classSize
var startGap
var stopGap
var classNumberList

var gapSettingsActive = false

func _ready():
	reset_gap_settings()


func _on_ClassSize_value_changed(value):
	classSize = value
	$MarginContainer/VBoxContainer/Label.text = str(value) + " Last student number"
	$MarginContainer/VBoxContainer/GapSettings/StartGap/StartGap.max_value = classSize
	$MarginContainer/VBoxContainer/GapSettings/StopGap/StopGap.max_value = classSize
	$MarginContainer/VBoxContainer/GapSettings/StopGap/StopGap.value = classSize
	

func _on_StartGap_value_changed(value):
	startGap = value
	$MarginContainer/VBoxContainer/GapSettings/StartGap/Label.text = str(value)


func _on_StopGap_value_changed(value):
	stopGap = value
	$MarginContainer/VBoxContainer/GapSettings/StopGap/Label.text = str(value)
	
	
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


func _on_Okay_pressed():
	make_class_number_list()
	Globals.pickStudents = true
	hide()


func _on_Back_pressed():
	reset_gap_settings()
	Globals.pickStudents = false
	hide()


func _on_SetGap_pressed():
	show_gap_settings()
	
func show_gap_settings():
	gapSettingsActive = true
	$MarginContainer/VBoxContainer/GapButtonCT.visible = false
	$MarginContainer/VBoxContainer/GapSettings.visible = true
	
func reset_gap_settings():
	gapSettingsActive = false
	$MarginContainer/VBoxContainer/GapButtonCT.visible = true
	$MarginContainer/VBoxContainer/GapSettings.visible = false