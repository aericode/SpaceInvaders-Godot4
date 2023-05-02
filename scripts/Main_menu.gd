extends Node2D

@onready var Hi_score_manager = get_node("Hi_score_manager")
@onready var Hi_score_display = get_node("Hi_score_display")

# Called when the node enters the scene tree for the first time.
func _ready():
	Hi_score_manager.handle_save_file_exists()
	Hi_score_manager.handle_scores_loaded()
	Hi_score_display.text = "[center]" + str(Global.hi_score) +"[/center]"
