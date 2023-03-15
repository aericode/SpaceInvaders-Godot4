extends Area2D

func _physics_process(delta):
	var movement_vector = Vector2(0,-10)
	position += movement_vector
	if(has_overlapping_areas()):
		queue_free()
