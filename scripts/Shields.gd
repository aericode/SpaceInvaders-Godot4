extends Node2D



func instantiate_brick(brick_position: Vector2):
	var brick_resource = preload("res://resources/Shield_brick.tscn")
	var brick = brick_resource.instantiate()
	brick.position = brick_position
	add_child(brick)


func get_brick_position_in_line(line_origin_position:Vector2, brick_index):
	var brick_width = 20
	return Vector2(line_origin_position.x + brick_index*brick_width, line_origin_position.y)

func instantiate_full_line(line_origin_position:Vector2):
	for brick_index in 4:
		instantiate_brick( get_brick_position_in_line(line_origin_position, brick_index) )

func instantiate_half_line(line_origin_position:Vector2):
	instantiate_brick( get_brick_position_in_line(line_origin_position, 0) )
	instantiate_brick( get_brick_position_in_line(line_origin_position, 3) )

func get_line_origin_position(shield_origin_position:Vector2, line_index):
	var brick_height = 20
	return Vector2(shield_origin_position.x, shield_origin_position.y + line_index*brick_height)
	
func instantiate_shield(shield_origin_position:Vector2):
	instantiate_full_line(get_line_origin_position(shield_origin_position, 0))
	instantiate_full_line(get_line_origin_position(shield_origin_position, 1))
	instantiate_half_line(get_line_origin_position(shield_origin_position, 2))

func get_shield_position(shield_index):
	var shield_set_origin  = Vector2(280, 515)
	var shield_horizontal_margin = 180
	return Vector2(shield_set_origin.x + shield_index*shield_horizontal_margin, shield_set_origin.y)
	
func instantiate_shield_set():
	var number_of_shields = 4
	
	for shield_index in number_of_shields:
		instantiate_shield(get_shield_position(shield_index))

