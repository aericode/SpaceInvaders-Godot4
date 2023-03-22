extends Area2D

@export var score_value = 0;

var row_index;
var column_index;

func die():
	queue_free()

func _on_area_entered(area):
	if(area.get_name()=="Player_bullet"):
		die()

func spawn_bullet():
	var bullet_resource = preload("res://resources/Enemy_bullet.tscn")
	var bullet = bullet_resource.instantiate()
	bullet.position = global_position + Vector2(0,-5)
	get_node("/root/World").add_child(bullet)
	
	
func shoot():
	spawn_bullet()

