extends TextureButton
"""
Part of the menu to set the grade and questions to be asked
"""

var button_text
var button_value: int

onready var grades: Array = Globals.GRADES


func _ready():
	pass

"""
Process delta is used to make sure only one grade button is pressed at a single time
"""
func _process(_delta):
	if (button_value + 1) != Globals.game_settings["grade"]:
		pressed = false

"""
When pressed update the game settings global and change button state to pressed
"""
func _on_GradeBTN_pressed():
	$Clicks.play()
	Globals.game_settings["grade"] = button_value + 1
	print(Globals.game_settings["grade"])
	pressed = true
	
"""
Used when instanciated to apply the text from list of grades to each button
"""
func set_button_text(grade):
	button_text = grade
	$Label.text = button_text
	

func set_button_value(value):
	button_value = value
