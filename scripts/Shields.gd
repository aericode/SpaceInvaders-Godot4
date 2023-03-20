extends Node2D



func instantiate_brick(brick_position: Vector2):
	var brick_resource = preload("res://resources/Shield_brick.tscn")
	var brick = brick_resource.instantiate()
	brick.position = brick_position
	get_node("/root/World").add_child(brick)


func get_brick_position_in_line(line_origin_position:Vector2, brick_index):
	var brick_width = 20
	return Vector2(line_origin_position.x + brick_index*brick_width, line_origin_position.y)

func instantiate_full_line(line_origin_position:Vector2):
	for brick_index in 4:
		instantiate_brick( get_brick_position_in_line(line_origin_position, brick_index) )

func instantiate_half_line(origin_position:Vector2):
	instantiate_brick( get_brick_position_in_line(origin_position, 0) )
	instantiate_brick( get_brick_position_in_line(origin_position, 3) )

	
