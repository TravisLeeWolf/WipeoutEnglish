extends Popup
"""
A confirmation popup that displays an option and allows user to accept or resume
prevous scene
"""


func _ready():
	pass
#	if get_tree().get_current_scene().get_name() == "Menu":
#		var maker = get_tree().get_root().find_node("Menu", true, false)
#		maker.connect("question_maker_message_sent", self, "makerMessage")


func _on_Back_pressed():
	$Clicks.play()
	$BG/VertCT/ButtonCT/Okay.visible = true
	hide()


func _on_Okay_pressed():
	$Clicks.play()
	if get_tree().get_current_scene().get_name() == "Game":
		QP.clear_questions()
		get_tree().change_scene("res://menu/menu.tscn")
	else:
#		get_tree().quit() Add back for offline game
		get_tree().change_scene("res://credits/credits.tscn")


func set_message_text(message):
	$BG/VertCT/Message.text = message



