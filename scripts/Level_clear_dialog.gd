extends Node2D

@onready var Game = get_node("/root/World")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(visible && Input.is_action_just_pressed("shoot")):
		visible = false
		get_tree().paused = false
		Game.set_next_stage()
