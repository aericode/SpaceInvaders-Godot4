extends Node2D


func instantiate_enemy(enemy_position:Vector2, row_index, column_index):
	var enemy_resource = preload("res://resources/Enemy.tscn")
	var enemy = enemy_resource.instantiate()
	var enemy_sprite
	
	enemy.set_position(enemy_position)
	if(row_index == 1):
		enemy.score_value =  40
		enemy_sprite = load("res://assets/enemies/red.png")
	if(row_index == 2 || row_index == 3):
		enemy.score_value =  20
		enemy_sprite = load("res://assets/enemies/yellow.png")
	if(row_index == 4 || row_index == 5):
		enemy.score_value =  10
		enemy_sprite = load("res://assets/enemies/green.png")
	
	enemy.get_node("Sprite2D").texture = enemy_sprite
	enemy.row_index    = row_index
	enemy.column_index = column_index 
	
	enemy.add_to_group("Enemy")
	add_child(enemy)

func instantiate_line(row_index):
	var vertical_offset = 20
	var horizontal_offset = 300
	var horizontal_limit = 900
	
	var side_spacing = 55
	var vertical_spacing = 48
	var height = row_index*vertical_spacing + vertical_offset
	
	var column_index = 0;
	
	for x_pos in range(horizontal_offset, horizontal_limit, side_spacing):
		instantiate_enemy(Vector2(x_pos, height), row_index, column_index)
		column_index+=1
		
func instantiate_swarm():
	var number_of_lines = 5
	for level in range(1,number_of_lines+1,1):
		instantiate_line(level)

func has_enemies():
	var enemy_array = get_children()
	return !enemy_array.is_empty()
	
func get_random_non_empty_column():
	var is_finished = false
	var column_array = []
	while(!is_finished):
		if(!has_enemies()):
			return null
		
		const NUMBER_OF_COLUMNS = 11
		var randomized_index = randi()%NUMBER_OF_COLUMNS
		var enemy_array = get_children()
		for enemy in enemy_array:
			if(enemy.column_index == randomized_index):
				column_array.push_back(enemy)
		if(column_array.size() > 0):
			is_finished = true
	return column_array

func get_nearest_enemy_in_column(enemy_column_array):
	var nearest_enemy =  enemy_column_array[0]
	for enemy in enemy_column_array:
		if(enemy.row_index > nearest_enemy.row_index):
			nearest_enemy = enemy
	return nearest_enemy
	



func enemy_shoot():
	if(has_enemies()):
		var enemy_column   = get_random_non_empty_column()
		var shooting_enemy = get_nearest_enemy_in_column(enemy_column)
		shooting_enemy.shoot()
	
var enemy_shooting_cooldown = 0;
func reset_enemy_shooting_cooldown():
	enemy_shooting_cooldown = 20 + randi() % 20;

func handle_shooting_timer():
	enemy_shooting_cooldown -= 1
	if(enemy_shooting_cooldown<=0):
		enemy_shoot()
		reset_enemy_shooting_cooldown()

enum MOVE_DIRECTION {LEFT, RIGHT}


var current_swarm_move_state = MOVE_DIRECTION.RIGHT
var is_swarm_next_step_down = false

func swarm_move_down_and_switch_direction():
	if(current_swarm_move_state == MOVE_DIRECTION.RIGHT):
		current_swarm_move_state = MOVE_DIRECTION.LEFT
	else:
		current_swarm_move_state = MOVE_DIRECTION.RIGHT
	is_swarm_next_step_down = true
	
func get_vector_from_move_direction(direction):
	var lateral_vector  = Vector2(18,0)
	var downards_vector = Vector2(0,20)
	
	var result = Vector2(0,0)
	
	if(is_swarm_next_step_down):
		result = downards_vector
		is_swarm_next_step_down = false
	else:
		match direction:
			MOVE_DIRECTION.RIGHT:
				result = lateral_vector
			MOVE_DIRECTION.LEFT:
				result = lateral_vector * -1
		
	
	return result

func get_enemy_number():
	var enemy_array = get_children()
	var enemy_count = enemy_array.size()
	return enemy_count

func move_swarm(direction):
	var movement_vector = get_vector_from_move_direction(direction)
	position += movement_vector
	
var enemy_movement_cooldown = 0;
func reset_enemy_movement_cooldown():
	enemy_movement_cooldown = get_enemy_number()

func handle_move_swarm_timer():
	enemy_movement_cooldown -= 1
	if(enemy_movement_cooldown<=0):
		move_swarm(current_swarm_move_state)
		reset_enemy_movement_cooldown()

func compare_enemy_position(enemy1, enemy2, swarm_extremity:MOVE_DIRECTION):
	if(swarm_extremity == MOVE_DIRECTION.RIGHT):
		if(enemy1.global_position.x > enemy2.global_position.x):
			return enemy1
		else:
			return enemy2
	if(swarm_extremity == MOVE_DIRECTION.LEFT):
		if(enemy1.global_position.x < enemy2.global_position.x):
			return enemy1
		else:
			return enemy2

func get_swarm_extreme_position(swarm_extremity:MOVE_DIRECTION):
	var enemies_array = get_children()
	var most_extreme_enemy = enemies_array[0]
	for enemy in enemies_array:
		most_extreme_enemy = compare_enemy_position(enemy,most_extreme_enemy,swarm_extremity)
	return most_extreme_enemy.global_position.x


func is_swarm_out_of_bounds():
	var lower_x_boundary = 215
	var upper_x_boundary = 950
	var swarm_position = get_swarm_extreme_position(current_swarm_move_state)

	var is_out_of_left_bound  = (current_swarm_move_state == MOVE_DIRECTION.LEFT)  && (swarm_position < lower_x_boundary)
	var is_out_of_right_bound = (current_swarm_move_state == MOVE_DIRECTION.RIGHT) && (swarm_position > upper_x_boundary)
	
	return is_out_of_left_bound or is_out_of_right_bound

func handle_swarm_move_state():
	if(is_swarm_out_of_bounds()):
		swarm_move_down_and_switch_direction()
		
func reset_position():
	position = Vector2.ZERO

func reset_swarm():
	reset_position()
	instantiate_swarm()

func _process(_delta):
	if(has_enemies()):
		handle_move_swarm_timer()
		handle_swarm_move_state()
		handle_shooting_timer()
	else:
		reset_swarm()
