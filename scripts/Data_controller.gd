extends Node2D

var save_path = "user://savegame.save" #place of the file
var dict = {}

func load_scores():
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	var content_json =  dict.parse_json(content)
	return content


func _ready():
	load_scores()


func _process(delta):
	pass
