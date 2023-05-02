extends Node2D

@onready var Hi_score_manager = get_node("Hi_score_manager")
@onready var Hi_score_congratulations_message = get_node("Hi_score_congratulations_message")
# Called when the node enters the scene tree for the first time.

func handle_postgame():
	if(Global.score > Global.hi_score):
		Hi_score_manager.save_hi_score(Global.score)
		Hi_score_congratulations_message.visible = true


func _ready():
	handle_postgame()

