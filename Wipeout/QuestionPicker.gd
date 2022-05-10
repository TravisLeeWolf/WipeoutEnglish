extends Node

var main_questions = [
	["How are you?", "res://Daily/henohenomoheji_man.png", ["daily", "feelings"]],
	["What's the date today?", "res://Daily/calender_himekuri.png", ["daily", "months"]],
	["What day is it today?", "res://Daily/template_calender_e.jpg", ["daily", "days"]],
	["How's the weather?", "res://Daily/job_otenki_oneesan.png", ["daily", "weather"]],
	["What's the time now?", "res://Daily/kaichu_dokei.png", ["daily", "time"]]
]

#{"question": , "local_img": , "img_url": "", "tags":, "grades":},
#var daily_dict = [
#	{"question": "How are you?", "local_img": "res://Daily/henohenomoheji_man.png", "img_url": "", "tags":["daily", "feelings"], "grades":[0]},
#	{"question": "What's the date today?", "local_img": "res://Daily/calender_himekuri.png", "img_url": "", "tags":["daily", "months"], "grades":[3, 4, 5, 6, 7, 8, 9]},
#	{"question": "What day is it today?", "local_img": "res://Daily/template_calender_e.jpg", "img_url": "", "tags":["daily", "days"], "grades":[0]},
#	{"question": "How's the weather?", "local_img": "res://Daily/job_otenki_oneesan.png", "img_url": "", "tags":["daily", "weather"], "grades":[0]},
#	{"question": "What's the time now?", "local_img": "res://Daily/kaichu_dokei.png", "img_url": "https://1.bp.blogspot.com/-UZtkSEX0wh4/U5l5_dNcEsI/AAAAAAAAhWs/UzJGVzyiX8Y/s400/kaichu_dokei.png", "tags":["daily", "time"], "grades":[4, 5, 6, 7, 8, 9]},
#]

var daily_questions = [
	["What time did you get up?", "res://Daily/neoki_girl_sawayaka.png", ["daily", "time"]],
	["What time did you go to bed?", "res://Daily/pet_inu_sleep.png", ["daily", "time"]],
	["What did you eat for breakfast?", "res://Daily/food_nattou_gohan.png", ["daily", "food"]],
	["What did you eat for dinner yesterday?", "res://Daily/syokuji_black_man.png", ["daily", "food"]],
	["How old are you?", "res://Daily/shigosan_753_kids.png", ["daily", "numbers"]],
	["What food do you like?", "res://Daily/food_zei2_kakou.png", ["daily", "food"]],
	["What animal do you like?", "res://Daily/zoo_doubutsuen.png", ["daily", "animals"]],
	["What color do you like?", "res://Daily/enogu_colorful.png", ["daily", "colors"]],
	["What anime do you like?", "res://Daily/kids_gokko_asobi.png", ["daily", "like"]],
	["What manga do you like?", "res://Daily/entertainment_comic.png", ["daily", "like"]],
	["What game do you like?", "res://Daily/game_driving.png", ["daily", "games"]],
	["How many pencils do you have?", "res://Daily/bunbougu_pencil_dozen.png", ["daily", "stationary"]],
	["What time is lunch time?", "res://Daily/kyusyoku_gaikokujin.png", ["daily", "time"]],
	["What's your pet's name?", "res://Daily/pet_esa_kame_woman.png", ["daily", "animals"]],
	["Do you have any brothers or sisters?", "res://Daily/brothers_chounan.png", ["daily", "relationships"]],
	["What sports do you like?", "res://Daily/family_tv_baseball2.png", ["daily", "sports"]]
]

var thirdfourth_daily_questions = [
	["What time did you get up?", "res://Daily/neoki_girl_sawayaka.png", ["daily", "time"]],
	["What time did you go to bed?", "res://Daily/pet_inu_sleep.png", ["daily", "time"]],
	["What food do you like?", "res://Daily/food_zei2_kakou.png", ["daily", "food"]],
	["What animal do you like?", "res://Daily/zoo_doubutsuen.png", ["daily", "animals"]],
	["What color do you like?", "res://Daily/enogu_colorful.png", ["daily", "colors"]],
	["What anime do you like?", "res://Daily/kids_gokko_asobi.png", ["daily", "like"]],
	["What manga do you like?", "res://Daily/entertainment_comic.png", ["daily", "like"]],
	["What game do you like?", "res://Daily/game_driving.png", ["daily", "games"]],
	["How many pencils do you have?", "res://Daily/bunbougu_pencil_dozen.png", ["daily", "stationary"]],
	["What sports do you like?", "res://Daily/family_tv_baseball2.png", ["daily", "sports"]]
]

var animal_pics = []
var animalSet = []

var fruit_pics = []
var fruit_set = []

var questionSet = []
var counter = 0
var setLength

func _ready():
	add_pics_to_list(animal_pics, "res://Pictures/Animals")
	add_pics_to_list(fruit_pics, "res://Pictures/Fruits")
#	animal_questions()
	add_questions_from_piclist(animalSet, animal_pics)
	add_questions_from_piclist(fruit_set, fruit_pics)
	
func reset_questions():
	questionSet = []
	counter = 0
	add_questions_to_set(main_questions)
	setLength = len(questionSet)
	if Globals.selectedGrade == "ES 3rd" or "ES 4th":
		add_questions_to_set(thirdfourth_daily_questions)
		add_questions_to_set(animalSet)
		add_questions_to_set(fruit_set)
	else:
		add_questions_to_set(daily_questions)
	
	
func add_questions_to_set(listOfQuestions):
	var questions = [] + listOfQuestions # To create a clone of a list without reference to original list
	while questions != []:
		randomize()
		var question = questions[randi() % len(questions)]
		if not questionSet.has(question):
			questionSet.append(question)
			questions.erase(question)


func pick_a_question():
	var question = []
	var choice = counter
	var topic = " | "
	if counter < setLength:
		for t in questionSet[choice][2]:
			topic = topic + t.capitalize() + " | "	
		question = [topic, choice, questionSet[choice][1], questionSet[choice][0]]
		counter = counter + 1
	else:
		counter = setLength + 1
		randomize()
		choice = randi() % len(questionSet) # divide by 0 error
		for t in questionSet[choice][2]:
			topic = topic + t.capitalize() + " | "	
		question = [topic, choice, questionSet[choice][1], questionSet[choice][0]]
	
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
		var chosen_template = question_templates[randi() % len(question_templates)]
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









