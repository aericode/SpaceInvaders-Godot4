extends Node2D

func instantiate_enemy(enemy_position:Vector2, row_index, column_index):
	var enemy_resource = preload("res://resources/Enemy.tscn")
	var enemy = enemy_resource.instantiate()
	var enemy_sprite
	
	enemy.set_position(enemy_position)
	if(row_index == 1):
		enemy.score_value =  40
		enemy_sprite = load("res://assets/red.png")
	if(row_index == 2 || row_index == 3):
		enemy.score_value =  20
		enemy_sprite = load("res://assets/yellow.png")
	if(row_index == 4 || row_index == 5):
		enemy.score_value =  10
		enemy_sprite = load("res://assets/green.png")
	
	enemy.get_node("Sprite2D").texture = enemy_sprite
	enemy.row_index    = row_index
	enemy.column_index = column_index 
	
	enemy.add_to_group("Enemy")	
	get_node("Swarm").add_child(enemy)

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
		
func instantiatee_swarm():
	var number_of_lines = 5
	for level in range(1,number_of_lines+1,1):
		instantiate_line(level)

func instantiate_player():
	var player_resource = preload("res://resources/Player.tscn")
	var player = player_resource.instantiate()
	player.position = Vector2(590, 615)
	add_child(player)

func has_enemies():
	var swarm_node = get_node("Swarm")
	var enemy_array = swarm_node.get_children()
	return !enemy_array.is_empty()
	
func get_random_non_empty_column():
	var swarm_node = get_node("Swarm")
	var is_finished = false
	var column_array = []
	while(!is_finished):
		if(!has_enemies()):
			return null
		
		const NUMBER_OF_COLUMNS = 11
		var randomized_index = randi()%NUMBER_OF_COLUMNS
		var enemy_array = swarm_node.get_children()
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
	enemy_shooting_cooldown = 80;

func handle_shooting_timer():
	enemy_shooting_cooldown -= 1
	if(enemy_shooting_cooldown<=0):
		enemy_shoot()
		reset_enemy_shooting_cooldown()

var current_swarm_move_state = MOVE_DIRECTION.RIGHT
enum MOVE_DIRECTION {LEFT, RIGHT, DOWN}
func get_vector_from_move_direction(direction):
	var lateral_vector  = Vector2(20,0)
	var downards_vector = Vector2(20,0)
	
	var result = Vector2(0,0)
	
	match direction:
		MOVE_DIRECTION.RIGHT:
			result = lateral_vector
		MOVE_DIRECTION.LEFT:
			result = lateral_vector * -1
		MOVE_DIRECTION.DOWN:
			result = downards_vector
	
	return result

func move_swarm(direction):
	var movement_vector = get_vector_from_move_direction(direction)
	get_node("Swarm").position += movement_vector
	
var enemy_movement_cooldown = 0;
func reset_enemy_movement_cooldown():
	enemy_movement_cooldown = 100;

func handle_move_swarm_timer(direction):
	enemy_movement_cooldown -= 1
	if(enemy_movement_cooldown<=0):
		move_swarm(current_swarm_move_state)
		reset_enemy_movement_cooldown()

func _process(_delta):
	handle_move_swarm_timer(current_swarm_move_state)
	handle_shooting_timer()
	
func _ready():
	instantiatee_swarm()
	instantiate_player()
