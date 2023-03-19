extends Area2D


func destroy_self():
	queue_free()

func is_area_harmless_on_collision(area:Area2D):
	return area.is_in_group("Enemy")

func _on_area_entered(area):	
	if(!is_area_harmless_on_collision(area)):
		destroy_self()

func move():
	var movement_vector = Vector2(0,10)
	position += movement_vector
	
func _physics_process(_delta):
	move()
