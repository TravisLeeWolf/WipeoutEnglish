extends Node
"""
Variables to be used accross scenes for setting up the game and keeping track of changes
"""
# For use in the menu and question picker
var GRADES = ["ES 1st", "ES 2nd", "ES 3rd", "ES 4th", "ES 5th", "ES 6th", "JHS 1st", "JHS 2nd", "JHS 3rd"]

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
	print("Globals loaded")

