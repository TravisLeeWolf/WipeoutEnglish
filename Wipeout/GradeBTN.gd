extends TextureButton


var myText


func _ready():
	pass


func _process(delta):
	if myText != Globals.selectedGrade:
		pressed = false


func setButtonText(grade):
	myText = grade
	$Label.text = myText


func _on_GradeBTN_pressed():
	Globals.selectedGrade = myText
	pressed = true
