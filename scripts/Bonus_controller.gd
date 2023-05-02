extends Node2D

var timer
var is_bonus_active = false

func set_random_timer():
	is_bonus_active = false
	timer = randi() % 500 + 2000
	
func handle_spawner():
	if (is_bonus_active):
		pass
	else:
		handle_timer()

func spawn_ship():
	is_bonus_active = true	
	const starting_position = Vector2(945,25)
	var ship_resource = preload("res://resources/Bonus_Enemy.tscn")
	var ship = ship_resource.instantiate()
	get_node("/root/World").add_child(ship)
	ship.position = starting_position

func handle_timer():
	timer -= 1
	if(timer <= 0):
		spawn_ship()


func on_ship_removed():
	is_bonus_active = false
	set_random_timer()

func _process(_delta):
	handle_spawner()
