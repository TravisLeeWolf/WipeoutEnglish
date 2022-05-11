extends Control

var studentNumberList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var getNewQ = get_tree().get_root().find_node("Game", true, false)
	getNewQ.connect("nextQuestion", self, "newQuestion")
#	if Globals.pickStudents:
#		pick_student_number()
	

func _process(_delta):
	$Background/VertCT/ButtonCT/StuffCT/TextureProgress.value = $Timer.time_left * 10


func newQuestion():
	var question = QP.pick_a_question()
	$Background/VertCT/Topic.text = question[0]
	var pic = load(question[2])
	$Background/VertCT/ContentCT/Picture.texture = pic
	$Background/VertCT/ContentCT/Question.text = question[3]
	if Globals.pickStudents:
		pick_student_number()
		$AnimationPlayer.play("ShowChosenStudent")
	$Timer.start()


func _on_OkayBTN_pressed():
	Globals.scoreBTN = false
	visible = false


func _on_AnotherQBTN_pressed():
	newQuestion()

func add_student_numbers():
	studentNumberList = [] + Globals.studentNumberList
	
func pick_student_number():
	if studentNumberList == []:
		add_student_numbers()
	randomize()
	var choice = studentNumberList[randi() % len(studentNumberList)]
	$StudentNumber/NumberText.text = str(choice)
	var numberToRemove = studentNumberList.find(choice)
	studentNumberList.remove(numberToRemove)
