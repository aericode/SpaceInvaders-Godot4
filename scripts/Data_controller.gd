extends Node

var save_path = "user://savegame.save" #place of the file

func load_scores():
	var json_object = JSON.new()
	
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	var content_json =  json_object.parse(content)
	Global.hi_scores = json_object
	print(Global.hi_scores)
	file.close()
	
func handle_scores_loaded():
	if(Global.hi_scores == {}):
		load_scores()

func create_save():
	var json_object = JSON.new()
	
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var( json_object.stringify({"hi_scores": [{"score":2000, "name":"test"}]}) )
	file.close()

func handle_save_file_exists():
	if (not FileAccess.file_exists(save_path)):
		create_save()

func _ready():
	handle_save_file_exists()
	handle_scores_loaded()

