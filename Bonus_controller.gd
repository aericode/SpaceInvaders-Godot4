extends Node2D

@onready var timer = 30
var is_bonus_active = false

func set_random_timer():
	timer = randi() % 500 + 1000  # generates a random integer between 0 and 9

	
func handle_spawner():
	if (is_bonus_active):
		pass
	else:
		handle_timer()

func spawn_ship():
	is_bonus_active = true	
	const starting_position = Vector2(945,32)
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

func _process(delta):
	handle_spawner()
