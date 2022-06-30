extends Node
"""
Variables to be used accross scenes for setting up the game and keeping track of changes
"""
var MY_PURPLE = Color(0.568627, 0.254902, 0.686275)
var MY_ORANGE = Color(0.901961, 0.372549, 0)

var GRADES: Array = []

# Game settings dictonary to contain all settings in the menu with defaults set
var game_settings: Dictionary = {
	"question_set": "Daily",
	"difficulty": 2,
	"number_of_teams": 6,
	"grid_size": 8,
	"grade": 6,
	"show_points": false,
	"auto_pick": false,
	"random_students": [],
}
var list_of_questions = []

var currentScore
var currentTeam = 0
var scoreBTN = false
var blockColor = Color.white

var number_of_teams = 6
var NumberOfTeams = 6
var teamMaxValue = 100
var studentNumberList = []
var showStudentPicker = false
var pickStudents = false

var english_on = true
var gridSize = 8
var difficultyFactor = 2
var selectedGrade = 0
var showPoints = true
var showPickBlock = false

var block_settings = true
var block_is_alphanumeric = true
var block_is_rainbow = false
var block_style = {
	"rainbow": false,
	"pictures": "none",
}

func _ready():
	# Splits the CSV text for grades into a list of grades
	GRADES = tr("GRADE_BUTTON").split("*")
	
"""
Used when the translation is changed and the grade buttons need to be updated
"""	
func update_grades_text():
	var grades_text: Array = tr("GRADE_BUTTON").split("*")
	for i in range(9):
		GRADES[i] = grades_text[i]

