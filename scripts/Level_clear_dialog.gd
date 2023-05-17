extends Node2D

@onready var Game = get_node("/root/World")

var exit_key: String = "shoot"

func handle_exit_key_press():
	if(exit_key!= "shoot" && exit_key != "escape"):
		push_warning("warning: invalid exit key for pause menu")
	if(visible && Input.is_action_just_pressed(exit_key)):
		visible = false
		get_tree().paused = false
		Game.set_next_stage()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_exit_key_press()
