extends Node2D

var save_path = "user://savegame.save" #place of the file

func load_scores():
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	var content_json =  Global.hi_scores.parse_json(content)
	file.close()
	
func check_if_scores_are_loaded():
	if(Global.hi_scores == []):
		load_scores()

func create_save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var([])
	file.close()

func check_if_file_exists():
	if (not FileAccess.file_exists(save_path)):
		create_save()
		
func _ready():
	check_if_file_exists()
	create_save()

