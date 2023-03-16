extends Area2D


func destroy_self():
	queue_free()

func _on_area_entered(area):
	var area_name = area.get_name()
	print(area_name)
	if(area_name!="Enemy" && area_name!="Player_bullet"):
		destroy_self()

func move():
	var movement_vector = Vector2(0,10)
	position += movement_vector
	
func _physics_process(delta):
	move()
