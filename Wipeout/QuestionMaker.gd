extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_fullscreen = false
	OS.window_size.x = 850
	OS.window_size.y = 480


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Upload_pressed():
	$PicUpload.popup()


func _on_Back_pressed():
	get_tree().change_scene("res://Menu.tscn")
