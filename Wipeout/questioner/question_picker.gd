extends Node

var main_questions = [
	["How are you?", "res://pictures/daily/henohenomoheji_man.png", ["daily", "feelings"]],
	["What day is it today?", "res://pictures/daily/template_calender_e.jpg", ["daily", "days"]],
	["How's the weather?", "res://pictures/daily/job_otenki_oneesan.png", ["daily", "weather"]],
]

var daily_questions = [
	["What's the date today?", "res://pictures/daily/calender_himekuri.png", ["daily", "months"]],
	["What's the time now?", "res://pictures/daily/kaichu_dokei.png", ["daily", "time"]],
	["What time did you get up?", "res://pictures/daily/neoki_girl_sawayaka.png", ["daily", "time"]],
	["What time did you go to bed?", "res://pictures/daily/pet_inu_sleep.png", ["daily", "time"]],
	["What did you eat for breakfast?", "res://pictures/daily/food_nattou_gohan.png", ["daily", "food"]],
	["What did you eat for dinner yesterday?", "res://pictures/daily/syokuji_black_man.png", ["daily", "food"]],
	["How old are you?", "res://pictures/daily/shigosan_753_kids.png", ["daily", "numbers"]],
	["What food do you like?", "res://pictures/daily/food_zei2_kakou.png", ["daily", "food"]],
	["What animal do you like?", "res://pictures/daily/zoo_doubutsuen.png", ["daily", "animals"]],
	["What color do you like?", "res://pictures/daily/enogu_colorful.png", ["daily", "colors"]],
	["What anime do you like?", "res://pictures/daily/kids_gokko_asobi.png", ["daily", "like"]],
	["What manga do you like?", "res://pictures/daily/entertainment_comic.png", ["daily", "like"]],
	["What game do you like?", "res://pictures/daily/game_driving.png", ["daily", "games"]],
	["How many pencils do you have?", "res://pictures/daily/bunbougu_pencil_dozen.png", ["daily", "stationary"]],
	["What time is lunch time?", "res://pictures/daily/kyusyoku_gaikokujin.png", ["daily", "time"]],
	["What's your pet's name?", "res://pictures/daily/pet_esa_kame_woman.png", ["daily", "animals"]],
	["Do you have any brothers or sisters?", "res://pictures/daily/brothers_chounan.png", ["daily", "relationships"]],
	["What sports do you like?", "res://pictures/daily/family_tv_baseball2.png", ["daily", "sports"]],
]

var thirdfourth_daily_questions = [
	["What time did you get up?", "res://pictures/daily/neoki_girl_sawayaka.png", ["daily", "time"]],
	["What time did you go to bed?", "res://pictures/daily/pet_inu_sleep.png", ["daily", "time"]],
	["What food do you like?", "res://pictures/daily/food_zei2_kakou.png", ["daily", "food"]],
	["What animal do you like?", "res://pictures/daily/zoo_doubutsuen.png", ["daily", "animals"]],
	["What color do you like?", "res://pictures/daily/enogu_colorful.png", ["daily", "colors"]],
	["What anime do you like?", "res://pictures/daily/kids_gokko_asobi.png", ["daily", "like"]],
	["What manga do you like?", "res://pictures/daily/entertainment_comic.png", ["daily", "like"]],
	["What game do you like?", "res://pictures/daily/game_driving.png", ["daily", "games"]],
	["How many pencils do you have?", "res://pictures/daily/bunbougu_pencil_dozen.png", ["daily", "stationary"]],
	["What sports do you like?", "res://pictures/daily/family_tv_baseball2.png", ["daily", "sports"]],
]


var questionSet = []
var counter = 0
var setLength
var picture_questions = []

func _ready():	
	pass

	
func reset_questions():
	var grade: int = Globals.game_settings["grade"]
	questionSet = []
	counter = 0
	picture_questions = []
	add_questions_to_set(main_questions)
	setLength = len(questionSet)
	if grade <= 2:
		pass
	elif grade >= 3 and grade <= 4:
		add_questions_to_set(thirdfourth_daily_questions)
	elif grade >= 5 and grade <=8:
		add_questions_to_set(daily_questions)
	elif grade == 9:
		add_questions_to_set(J2.questions_to_ask)
	add_questions_from_list()
	
	
func add_questions_to_set(listOfQuestions):
	if not listOfQuestions == []:
		var questions = [] + listOfQuestions # To create a clone of a list without reference to original list
		while questions != []:
			randomize()
			var question = questions[randi() % len(questions)]
			if not questionSet.has(question):
				questionSet.append(question)
				questions.erase(question)


func pick_a_question():
	if questionSet == []:
		reset_questions()
	var question = []
	var choice = counter
	var topic = " | "
	if counter < setLength:
		for t in questionSet[choice][2]:
			topic = topic + t.capitalize() + " | "	
		if len(questionSet[choice]) > 3:
			question = [topic, choice, questionSet[choice][1], questionSet[choice][0], questionSet[choice][3]]
		else:
			question = [topic, choice, questionSet[choice][1], questionSet[choice][0]]
		counter = counter + 1
	else:
		counter = setLength + 1
		randomize()
		choice = randi() % len(questionSet) # divide by 0 error
		for t in questionSet[choice][2]:
			topic = topic + t.capitalize() + " | "	
		if len(questionSet[choice]) > 3:
			question = [topic, choice, questionSet[choice][1], questionSet[choice][0], questionSet[choice][3]]
		else:
			question = [topic, choice, questionSet[choice][1], questionSet[choice][0]]
	questionSet.remove(choice)
	return question
	

func make_questions_from_pic_list(picture_list) -> void:
	var template = ["What's this in English?", "", ["guess", picture_list]]
	var question = []
	for picture in PicList.pictures[picture_list]:
		template[1] = picture
		question = [] + template
		picture_questions.append(question)
		
	
func add_questions_from_list() -> void:
	if not Globals.list_of_questions == []:
		for question_set in Globals.list_of_questions:
			make_questions_from_pic_list(question_set)
		add_questions_to_set(picture_questions)


func clear_questions() -> void:
	questionSet = []
	counter = 0
	picture_questions = []
