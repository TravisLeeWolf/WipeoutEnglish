extends Control
"""
To be removed for web API
"""


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


func _on_Back_pressed():
	hide()
