extends Control

var slide = 0

var english_helper = [
	"res://assets/howto/how_to_menu.jpg",
	"res://assets/howto/how_to_game.jpg",
	"res://assets/howto/how_to_questions.jpg",
]

var japanese_helper = [
	"res://assets/howto/how_to_jp_menu.jpg",
	"res://assets/howto/how_to_jp_game.jpg",
	"res://assets/howto/how_to_jp_questions.jpg",
]

func _ready():
	start_from_begining()


func start_from_begining():
	slide = 0
	if LanguageManager.check_language() == "ja":
		$TapThrough.texture_normal = load(japanese_helper[slide])
	else:
		$TapThrough.texture_normal = load(english_helper[slide])
	

func _on_TapThrough_pressed():
	slide = slide + 1
	if slide < 3:
		if LanguageManager.check_language() == "ja":
			$TapThrough.texture_normal = load(japanese_helper[slide])
		else:
			$TapThrough.texture_normal = load(english_helper[slide])
	else:
		hide()
		start_from_begining()
