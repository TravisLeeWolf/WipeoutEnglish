extends TextureButton
"""
Part of the menu to set the grade and questions to be asked
"""

var button_text

onready var grades: Dictionary = Globals.GRADES


func _ready():
	pass

"""
Process delta is used to make sure only one grade button is pressed at a single time
"""
func _process(_delta):
	if grades[button_text] != Globals.game_settings["grade"]:
		pressed = false

"""
When pressed update the game settings global and change button state to pressed
"""
func _on_GradeBTN_pressed():
	Globals.game_settings["grade"] = grades[button_text]
	pressed = true
	
"""
Used when instanciated to apply the text from list of grades to each button
"""
func set_button_text(grade):
	button_text = grade
	$Label.text = button_text
