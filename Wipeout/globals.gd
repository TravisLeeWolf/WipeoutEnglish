extends Node
"""
Variables to be used accross scenes for setting up the game and keeping track of changes
"""
# For use in the menu and question picker
var GRADES = {
	"ES 1st": 1,
	"ES 2nd": 2,
	"ES 3rd": 3,
	"ES 4th": 4,
	"ES 5th": 5,
	"ES 6th": 6,
	"JHS 1st": 7,
	"JHS 2nd": 8,
	"JHS 3rd": 9
}

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

var currentScore
var currentTeam = 0
var scoreBTN = false

var NumberOfTeams = 6
var teamMaxValue = 100
var studentNumberList = []
var pickStudents = false

var gridSize = 8
var difficultyFactor = 2
var selectedGrade = 0
var showPoints = false
var showPickBlock = false


func _ready():
	pass

