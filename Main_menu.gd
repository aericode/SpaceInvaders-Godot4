extends Node2D

@onready var Hi_score_manager = get_node("Hi_score_manager")

# Called when the node enters the scene tree for the first time.
func _ready():
	Hi_score_manager.handle_save_file_exists()
	Hi_score_manager.handle_scores_loaded()
