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

var animal_pics = []
var animalSet = []

var fruit_pics = []
var fruit_set = []

var questionSet = []
var counter = 0
var setLength

func _ready():
	add_pics_to_list(animal_pics, "res://pictures/animals")
	add_pics_to_list(fruit_pics, "res://pictures/fruits")
#	animal_questions()
	add_questions_from_piclist(animalSet, animal_pics)
	add_questions_from_piclist(fruit_set, fruit_pics)

	
func reset_questions():
	var grade: int = Globals.game_settings["grade"]
	questionSet = []
	counter = 0
	add_questions_to_set(main_questions)
	setLength = len(questionSet)
	if grade <= 2:
		add_questions_to_set(animalSet)
		add_questions_to_set(fruit_set)
	elif grade >= 3 and grade <= 4:
		add_questions_to_set(thirdfourth_daily_questions)
	elif grade >= 5 and grade <=8:
		add_questions_to_set(daily_questions)
	elif grade == 9:
		add_questions_to_set(J2.questions_to_ask)
	
	
func add_questions_to_set(listOfQuestions):
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

# Not used
func animal_questions():
	var question_template =  ["What animal is this?", "", ["animals"]]
	var question = []
	for pic in animal_pics:
		question_template[1] = pic
		question = [] + question_template
		animalSet.append(question)


func add_questions_from_piclist(question_set, pic_list):
	var question_templates = [["What is this?", "", ["guess"]], ["Do you like ~ ?", "", ["likes"]]]
	var question = []
	for pic in pic_list:
		randomize()
		var chosen_template = question_templates[0]
#		var chosen_template = question_templates[randi() % len(question_templates)]
		chosen_template[1] = pic
		question = [] + chosen_template
		question_set.append(question)


func add_pics_to_list(list, path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".png"):
				list.append(path + "/" + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")









