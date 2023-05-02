extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(visible && Input.is_action_just_pressed("shoot")):
		visible = false
		get_tree().paused = false
