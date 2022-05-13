extends TextureButton
"""
Part of the menu to set the grade and questions to be asked
"""

var myText
var GRADES = {
	"ES 1st": 1,
	"ES 2nd": 2,
	"ES 3rd": 3,
	"ES 4th": 4,
	"ES 5th": 5,
	"ES 6th": 6,
	"JHS 1st": 7,
	"JHS 2nd": 8,
	"JHS 3rd": 9
}


func _ready():
	pass


func _process(delta):
	if GRADES[myText] != Globals.selectedGrade:
		pressed = false


func setButtonText(grade):
	myText = grade
	$Label.text = myText


func _on_GradeBTN_pressed():
	Globals.selectedGrade = GRADES[myText]
	pressed = true
	print("Grade set to: " + str(Globals.selectedGrade))
