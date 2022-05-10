extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var getNewQ = get_tree().get_root().find_node("Game", true, false)
	getNewQ.connect("nextQuestion", self, "newQuestion")
	

func _process(_delta):
	$Background/VertCT/ButtonCT/StuffCT/TextureProgress.value = $Timer.time_left * 10

func newQuestion():
	var question = QP.pick_a_question()
	$Background/VertCT/Topic.text = question[0]
	var pic = load(question[2])
	$Background/VertCT/ContentCT/Picture.texture = pic
	$Background/VertCT/ContentCT/Question.text = question[3]
	$Timer.start()

func _on_OkayBTN_pressed():
	Globals.scoreBTN = false
	visible = false


func _on_AnotherQBTN_pressed():
	newQuestion()
