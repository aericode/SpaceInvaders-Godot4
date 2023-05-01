extends Node

var save_path = "user://savegame.save" #place of the file

func load_hi_score():
	var file = FileAccess.open(save_path, FileAccess.READ)
	Global.hi_score = file.get_32()
	file.close()
	
func handle_scores_loaded():
	if(Global.hi_score == -1):
		load_hi_score()

func create_save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_32(0)
	file.close()

func handle_save_file_exists():
	if (not FileAccess.file_exists(save_path)):
		create_save()

func save_hi_score(new_score: int):
	Global.hi_score = new_score
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_32(new_score)
	file.close()
#
#func _ready():
#	handle_save_file_exists()
#	handle_scores_loaded()

