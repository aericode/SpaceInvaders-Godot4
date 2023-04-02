extends Area2D

func move():
	var movement_vector = Vector2(0,-15)
	position += movement_vector

func _on_area_entered(_area):
	queue_free()


func _physics_process(_delta):
	move()
