extends Area2D

@onready var Game = get_node("/root/World")
@export var score_value = 0;

var row_index;
var column_index;

func die():
	Game.score_points(score_value)
	queue_free()

func _on_area_entered(area):
	if(area.get_name()=="Player_bullet"):
		die()

func spawn_bullet():
	var bullet_resource = preload("res://resources/Enemy_bullet.tscn")
	var bullet = bullet_resource.instantiate()
	bullet.position = global_position + Vector2(0,-5)
	get_node("/root/World").add_child(bullet)

func handle_reaching_player():
	if(position.y >= 600):
		Game.handle_game_over()
		
func shoot():
	spawn_bullet()

func _process(_delta):
	handle_reaching_player()

