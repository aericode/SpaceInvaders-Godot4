extends Area2D


@export var speed = 4 # How fast the player will move (pixels/sec).
@onready var screen_size_x = get_viewport_rect().size.x




func _process(delta):
	var input = 0
	if Input.is_action_pressed("right"):
		input = 1
	if Input.is_action_pressed("left"):
		input =-1

	position.x = clamp(position.x + input * speed, 18, 750)
