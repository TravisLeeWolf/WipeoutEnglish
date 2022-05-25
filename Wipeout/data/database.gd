extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://data/questions"


func _ready():
	read_from_db()


func commit_data_to_db():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	# Setting new data to enter into database
	var tableName = "questions" # Name of the table we'll add our data into
	var dict : Dictionary = Dictionary() # Create a new dictonary
	dict["text"] = "What's the date today?"
	dict["tags"] = "Daily, Dates"
	# Now insert the data into the database
	db.insert_row(tableName, dict) # Name of the table we want to insert into and the data in dict format
	db.close_db()
	
func read_from_db():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	# Read data from questions table
	var tableName = "questions"
	db.query("select * from " + tableName + ";") # This is the SQL query
	for i in range(db.query_result.size()):
		print("Query results: ", db.query_result[i]["text"], db.query_result[i]["tags"])
	db.close_db()
	
# 25 min tut vid	
	
	
	
	
