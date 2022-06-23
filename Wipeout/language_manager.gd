extends Node


var language := "en"

func update_language(new_language: String) -> void:
	language = new_language
	TranslationServer.set_locale(language)
	
func check_language():
	var lang = TranslationServer.get_locale()
	return lang
