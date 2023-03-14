extends Area2D

var bullet_resource = preload("res://resources/bullet.tscn")

@export var speed = 4 # How fast the player will move (pixels/sec).


@export var player_limit_begin = 0
@export var player_limit_end = 0


func _process(delta):
	var input = 0
	if Input.is_action_pressed("right"):
		input = 1
	if Input.is_action_pressed("left"):
		input =-1
	position.x = clamp(position.x + input * speed, player_limit_begin, player_limit_end)
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_resource.instantiate()
		bullet.position = get_position() + Vector2(0,-5)
		get_node("/root/World").add_child(bullet)
		
