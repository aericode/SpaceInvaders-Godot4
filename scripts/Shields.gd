extends Node2D



func instantiate_brick(brick_position: Vector2):
	var brick_resource = preload("res://resources/Shield_block.tscn")
	var brick = brick_resource.instantiate()
	brick.position = brick_position
	get_node("/root/World").add_child(brick)


func get_brick_position_in_line(line_origin_position:Vector2, brick_index):
		return Vector2(line_origin_position.x + brick_index*20, line_origin_position.y)

func instantiate_full_line(line_origin_position:Vector2):
	const brick_width = 20
	for brick_index in 6:
		instantiate_brick( get_brick_position_in_line(line_origin_position, brick_index) )

func instantiate_half_line(origin_position:Vector2):
	const brick_width = 20
	for brick_index in 6:
		instantiate_brick( get_brick_position_in_line(origin_position, brick_index) )

# Called when the node enters the scene tree for the first time.
func _ready():
	instantiate_brick(Vector2(300,300))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
