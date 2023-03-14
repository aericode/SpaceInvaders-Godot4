extends Area2D

var bullet_resource = preload("res://resources/bullet.tscn")

@export var speed = 4 # How fast the player will move (pixels/sec).

@export var player_limit_begin = 0
@export var player_limit_end = 0

var shot_cooldown = 0

func handle_movement():
	var input = 0
	if Input.is_action_pressed("right"):
		input = 1
	if Input.is_action_pressed("left"):
		input =-1
	position.x = clamp(position.x + input * speed, player_limit_begin, player_limit_end)

func spawn_bullet():
	var bullet = bullet_resource.instantiate()
	bullet.position = get_position() + Vector2(0,-5)
	get_node("/root/World").add_child(bullet)

func set_cooldown():
	var cooldown_reset_value = 30
	shot_cooldown = cooldown_reset_value

func decrease_cooldown():
	var cooldown_decrease_value = 1
	if(shot_cooldown < 0):
		shot_cooldown = 0
	elif(shot_cooldown > 0):
		shot_cooldown -= cooldown_decrease_value
	
func handle_shooting():
	if (Input.is_action_just_pressed("shoot") && shot_cooldown <= 0):
		spawn_bullet()
		set_cooldown()

func _process(delta):
	handle_movement()
	handle_shooting()
	decrease_cooldown()
	
		
