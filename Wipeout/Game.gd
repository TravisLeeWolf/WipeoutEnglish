extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tile = preload("res://Tile.tscn")
onready var team = preload("res://Team.tscn")
onready var wipeout = preload("res://Wipeout.tscn")

signal flipCard
signal teamSelected
signal givePoints
signal nextQuestion
signal revertScore
signal wipeout

var blockList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_fullscreen = true
	$MainCT/GameCT/GameBoardCT.columns = Globals.gridSize
	blockList = []
	
	# Adding tiles to the board
	var letters = ["A", "B", "C", "D"]
	var tileName = ""
	var gridLength
	var gridWidth
	if Globals.gridSize == 4:
		gridLength = 4
		gridWidth = 3
	elif Globals.gridSize == 6:
		gridLength = 6
		gridWidth = 3
	else:
		gridLength = 8
		gridWidth = 4
	for i in range(gridWidth):
		for j in range(gridLength):
			tileName = letters[i] + str(j + 1)
			var t = tile.instance()
			t.setTileText(tileName)
#			t.connect("flipCard", self, "cardFlip")
			$MainCT/GameCT/GameBoardCT.add_child(t)
			# Add list of block to pick from
			if Globals.showPickBlock:
				blockList.append(tileName)
			
	# End adding tiles to the board
	
	# Adding 6 players to the board
	for i in range(Globals.NumberOfTeams):
		var te = team.instance()
		te.setTeam(i)
		$MainCT/HeadCT/ProgressCT.add_child(te)	
		$MainCT/GameCT/ButtonCT/PickTeamBTN.add_item(("Team " + str(i + 1)), i + 1) # Add teams to PickTeamBT
		
	var selectedTeamColor = get_tree().get_root().find_node("Team", true, false)
	selectedTeamColor.connect("changeListColor", self, "changeListColor")
	
	if Globals.showPickBlock:
		$MainCT/GameCT/ButtonCT/CenterCT/PickRandom.visible = true
	else:
		$MainCT/GameCT/ButtonCT/CenterCT/PickRandom.visible = false
	
#func _process(_delta):
#	$MainCT/GameCT/ButtonCT/YesNoCT/YesBTN.disabled = Globals.scoreBTN

func changeListColor(color):
	$MainCT/GameCT/ButtonCT/PickTeamBTN.add_color_override("bg_color", color)

func _on_YesBTN_pressed():
	emit_signal("flipCard")
	Globals.currentTeam = $MainCT/GameCT/ButtonCT/PickTeamBTN.selected
	$Timer.start()
	Globals.scoreBTN = true
	if Globals.currentScore == "X":
		emit_signal("wipeout")
	

func _on_PickTeamBTN_item_selected(index):
	emit_signal("teamSelected", index)

func yesWorking():
	$MainCT/GameCT/ButtonCT/CenterCT/CR/Message.text = "Working!"

func _on_NextQuestionBTN_pressed():
	emit_signal("nextQuestion")
	$Questions.visible = true


func _on_Timer_timeout():
	emit_signal("givePoints")


func _on_FinishGameBTN_pressed():
	$Confirmation.set_message_text("Exit the game and return to menu?")
	$Confirmation.popup()
	
func _input(event):
	if event.is_action_pressed("ui_delete"):
		if OS.window_fullscreen == true:
			OS.window_fullscreen = false
		else:
			OS.window_fullscreen = true


func _on_Button_pressed():
	get_tree().change_scene("res://QuestionMaker.tscn")


func _on_RevertBTN_pressed():
	emit_signal("revertScore")



func _on_PickRandom_pressed():
	if len(blockList) != 0:
		$MainCT/GameCT/ButtonCT/CenterCT/PickRandom.text = blockList[randi() % (len(blockList)) ]
		var toRemoveFromList = blockList.find($MainCT/GameCT/ButtonCT/CenterCT/PickRandom.text)
		blockList.remove(toRemoveFromList)
	else:
		$MainCT/GameCT/ButtonCT/CenterCT/PickRandom.visible = false
