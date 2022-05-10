extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_current_scene().get_name() == "Menu":
		var maker = get_tree().get_root().find_node("Menu", true, false)
		maker.connect("makerPopup", self, "makerMessage")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_message_text(message):
	$BG/VertCT/Message.text = message


func _on_Back_pressed():
	$BG/VertCT/ButtonCT/Okay.visible = true
	hide()
	
	
func makerMessage():
	$BG/VertCT/ButtonCT/Okay.visible = false
	set_message_text("I'm still working on this, please check back later.")
	visible = true


func _on_Okay_pressed():
	if get_tree().get_current_scene().get_name() == "Game":
		QP.reset_questions()
		get_tree().change_scene("res://Menu.tscn")
	else:
#		get_tree().quit() Add back for offline game
		get_tree().change_scene("res://Credits.tscn")
