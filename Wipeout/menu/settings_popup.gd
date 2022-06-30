extends Popup

var picture_sets = PicList.pictures.keys()
onready var block = preload("res://game/block.tscn")

func _ready():
	setup_text()
	add_picture_list_to_options()
	
func _process(_delta):
	if Globals.pickStudents:
		$MarginBox/VBox/ExtraBox/PickStudents.pressed = true
	else:
		$MarginBox/VBox/ExtraBox/PickStudents.pressed = false
	

func add_blocks(picture_set = "a1, b2, c3, d4"):
	var block_names = ["A1", "B2", "C3"]
	for i in range(3):
		var b = block.instance()
		if not picture_set == "a1, b2, c3, d4":
			b.setTileText("")
			Globals.block_is_alphanumeric = false
			b.picture_set = PicList.pictures[picture_set]
		else:
			b.setTileText(block_names[i])
			Globals.block_is_alphanumeric = true
			Globals.blockColor = Color.white
			b.set_random_color()
		$MarginBox/VBox/BlockStyleBox/BlockDisplay.add_child(b)


func add_picture_list_to_options():
	$MarginBox/VBox/BlockStyleBox/PictureOptions.add_item("A1, B2, C3, D4")
	for i in range(len(picture_sets)):
		$MarginBox/VBox/BlockStyleBox/PictureOptions.add_item(picture_sets[i])

	
func clear_blocks():
	Globals.blockColor = Color.white
	for node in $MarginBox/VBox/BlockStyleBox/BlockDisplay.get_children():
		$MarginBox/VBox/BlockStyleBox/BlockDisplay.remove_child(node)
		node.queue_free()


func _on_PictureOptions_item_selected(index: int) -> void:
	$Clicks.play()
	var picture_set = $MarginBox/VBox/BlockStyleBox/PictureOptions.get_item_text(index)
	clear_blocks()
	Globals.block_settings = true
	add_blocks(picture_set)


func _on_ColorChange_pressed() -> void:
	$Clicks.play()
	if $MarginBox/VBox/BlockStyleBox/ColorChange.pressed == true:
		Globals.block_is_rainbow = true
	else:
		Globals.block_is_rainbow = false
	clear_blocks()
	Globals.block_settings = true
	add_blocks()


func _on_Cancel_pressed() -> void:
	clear_blocks()
	Globals.block_settings = false
	hide()


func _on_Okay_pressed() -> void:
	clear_blocks()
	Globals.block_style["rainbow"] = Globals.block_is_rainbow
	var index = $MarginBox/VBox/BlockStyleBox/PictureOptions.selected
	if index == 0:
		Globals.block_style["pictures"] = "none"
	else:
		Globals.block_style["pictures"] = $MarginBox/VBox/BlockStyleBox/PictureOptions.get_item_text(index)
	hide()


func _on_MoreTeams_pressed() -> void:
	$Clicks.play()
	if $MarginBox/VBox/ExtraBox/MoreTeams.pressed:
		Globals.number_of_teams = 18
	else:
		Globals.number_of_teams = 6


func _on_ChooseRandom_pressed():
	$Clicks.play()
	if $MarginBox/VBox/ExtraBox/ChooseRandom.pressed:
		Globals.showPickBlock = true
	else:
		Globals.showPickBlock = false


func _on_PickStudents_pressed():
	$Clicks.play()
	Globals.showStudentPicker = true



func _on_HidePoints_pressed():
	$Clicks.play()
	if $MarginBox/VBox/ExtraBox/HidePoints.pressed:
		Globals.showPoints = false
	else:
		Globals.showPoints = true


func setup_text() -> void:
	$MarginBox/VBox/ExtraBox/ChooseRandom/Label.text = "AUTO_PICK_BUTTON"
	$MarginBox/VBox/ExtraBox/PickStudents/Label.text = "RANDOM_STUDENTS_BUTTON"
	$MarginBox/VBox/ExtraBox/HidePoints/Label.text = "HIDE_POINTS_BUTTON"
