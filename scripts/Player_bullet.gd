extends Area2D

func move():
	var movement_vector = Vector2(0,-10)
	position += movement_vector

func _on_area_entered(area):
	queue_free()

func _physics_process(delta):
	move()
