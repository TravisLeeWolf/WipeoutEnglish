extends Control

var studentNumberList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/VertCT/ContentCT/TextBox/HintButton.text = "SHOW_HINT_BUTTON"
	var getNewQ = get_tree().get_root().find_node("Game", true, false)
	getNewQ.connect("nextQuestion", self, "newQuestion")
#	if Globals.pickStudents:
#		pick_student_number()
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	

func _process(_delta):
	$Background/VertCT/ButtonCT/StuffCT/TextureProgress.value = $Timer.time_left * 10


func newQuestion():
	var question = QP.pick_a_question()
	$Background/VertCT/Topic.text = question[0]
	check_if_local_picture(question[2])
#	var pic = load(question[2])
#	$Background/VertCT/ContentCT/Picture.texture = pic
	$Background/VertCT/ContentCT/TextBox/Question.text = question[3]
	if len(question) > 4:
		$Background/VertCT/ContentCT/TextBox/HintText.text = question[4]
		$Background/VertCT/ContentCT/TextBox/HintButton.visible = true
	else:
		$Background/VertCT/ContentCT/TextBox/HintButton.visible = false
	if Globals.pickStudents:
		pick_student_number()
		$AnimationPlayer.play("ShowChosenStudent")
	$Timer.start()


func _on_OkayBTN_pressed():
	$Clicks.play()
	Globals.scoreBTN = false
	$Background/VertCT/ContentCT/TextBox/HintText.visible = false
	visible = false
	$AnimationPlayer.stop()


func _on_AnotherQBTN_pressed():
	$Clicks.play()
	$Background/VertCT/ContentCT/TextBox/HintText.visible = false
	$AnimationPlayer.stop()
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


func check_if_local_picture(picture_text):
	if picture_text.begins_with("res://"):
		var pic = load(picture_text)
		$Background/VertCT/ContentCT/Picture.texture = pic
	else:
		$HTTPRequest.request(picture_text)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var img = Image.new()
	var pic = img.load_png_from_buffer(body) # Also needs to handle jpg
	
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	$Background/VertCT/ContentCT/Picture.texture = tex


func _on_HintButton_pressed():
	$Clicks.play()
	$Background/VertCT/ContentCT/TextBox/HintText.visible = true
	$Background/VertCT/ContentCT/TextBox/HintButton.visible = false
