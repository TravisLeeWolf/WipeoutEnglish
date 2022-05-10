extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_Refresh_pressed():
	$HTTPRequest.request($MainCT/PicCT/TextCT/URLText.text)

func _on_request_completed(result, response_code, headers, body):
	var img = Image.new()
	var pic = img.load_png_from_buffer(body) # Also needs to handle jpg
	
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	$MainCT/PicCT/Picture.texture = tex
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	hide()
