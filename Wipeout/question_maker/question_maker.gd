extends Control
"""
To be removed for web API
"""


func _ready():
	OS.window_fullscreen = false
	OS.window_size.x = 850
	OS.window_size.y = 480


func _on_Upload_pressed():
	$PicUpload.popup()


func _on_Back_pressed():
	get_tree().change_scene("res://Menu.tscn")
