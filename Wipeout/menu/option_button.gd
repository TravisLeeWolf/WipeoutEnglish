extends TextureButton

var my_text

func _ready():
	self_modulate = Color(145, 65, 172)


func _on_OptionButton_pressed():
	self_modulate = Color(230, 97, 0)
