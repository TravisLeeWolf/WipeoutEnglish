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

var animalSet = []
var fruit_set = []
var weather_set = []
var feelings_set = []
var days_set = []
var color_set = []
var number_set = []
var month_set = []
var stationary_set = []
var sports_set = []

var set_dictionary = {
	"none" : [],
	"animals": animalSet,
	"fruits": fruit_set,
	"weather": weather_set,
	"feelings": feelings_set,
	"days": days_set,
	"colors": color_set,
	"numbers": number_set,
	"months": month_set,
	"stationary": stationary_set,
	"sports": sports_set
}

var questionSet = []
var counter = 0
var setLength

func _ready():	
	add_questions_from_piclist(animalSet, PicList.pictures["animals"])
	add_questions_from_piclist(fruit_set, PicList.pictures["fruits"])
	add_questions_from_piclist(weather_set, PicList.pictures["weather"])
	add_questions_from_piclist(feelings_set, PicList.pictures["feelings"])
	add_questions_from_piclist(days_set, PicList.pictures["days"])
	add_questions_from_piclist(color_set, PicList.pictures["colors"])
	add_questions_from_piclist(number_set, PicList.pictures["numbers"])
	add_questions_from_piclist(month_set, PicList.pictures["months"]) 
	add_questions_from_piclist(stationary_set, PicList.pictures["stationary"])
	add_questions_from_piclist(sports_set, PicList.pictures["sports"])

	
func reset_questions():
	var grade: int = Globals.game_settings["grade"]
	var questions_selected = Globals.game_settings["question_set"]
	if questions_selected == "Daily" or questions_selected == "Question Set":
		questions_selected = "none"
	questionSet = []
	counter = 0
	add_questions_to_set(main_questions)
	setLength = len(questionSet)
	if grade <= 2:
		add_questions_to_set(set_dictionary[questions_selected])
	elif grade >= 3 and grade <= 4:
		add_questions_to_set(thirdfourth_daily_questions)
		add_questions_to_set(set_dictionary[questions_selected])
	elif grade >= 5 and grade <=8:
		add_questions_to_set(daily_questions)
		add_questions_to_set(set_dictionary[questions_selected])
	elif grade == 9:
		add_questions_to_set(J2.questions_to_ask)
	
	
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


func add_questions_from_piclist(question_set, pic_list):
	var template = ["What's this in English?", "", ["guess"]]
	var question = []
	for pic in pic_list:
		template[1] = pic
		question = [] + template
		question_set.append(question)

