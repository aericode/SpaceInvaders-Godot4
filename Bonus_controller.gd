extends Node2D

@onready var timer = 30


func set_random_timer():
	timer = randi() % 500 + 360  # generates a random integer between 0 and 9
	

func spawn_ship():
	const starting_position = Vector2(945,32)	
	var ship_resource = preload("res://resources/Bonus_Enemy.tscn")
	var ship = ship_resource.instantiate()
	get_node("/root/World").add_child(ship)	
	ship.position = starting_position

func handle_timer():
	timer -= 1
	if(timer <= 0):
		spawn_ship()
	
func _ready():
	set_random_timer()

func _process(delta):
	handle_timer()
