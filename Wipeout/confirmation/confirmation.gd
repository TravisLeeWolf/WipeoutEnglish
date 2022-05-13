extends Popup
"""
A confirmation popup that displays an option and allows user to accept or resume
prevous scene
"""


func _ready():
	if get_tree().get_current_scene().get_name() == "Menu":
		var maker = get_tree().get_root().find_node("Menu", true, false)
		maker.connect("question_maker_message_sent", self, "makerMessage")


func _on_Back_pressed():
	$BG/VertCT/ButtonCT/Okay.visible = true
	hide()


func _on_Okay_pressed():
	if get_tree().get_current_scene().get_name() == "Game":
		QP.reset_questions()
		get_tree().change_scene("res://menu/menu.tscn")
	else:
#		get_tree().quit() Add back for offline game
		get_tree().change_scene("res://credits/credits.tscn")


func set_message_text(message):
	$BG/VertCT/Message.text = message
	
	
func makerMessage():
	$BG/VertCT/ButtonCT/Okay.visible = false
	set_message_text("I'm still working on this, please check back later.")
	visible = true



