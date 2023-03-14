extends Node2D

var enemy_resource = preload("res://enemy.tscn")

func instantiate_enemy(position:Vector2, line_index):
	var enemy = enemy_resource.instantiate()
	enemy.set_position(position)
	if(line_index == 1):
		enemy.score_value =  40
	if(line_index == 2 || line_index == 3):
		enemy.score_value =  20
	if(line_index == 4 || line_index == 5):
		enemy.score_value =  10
	
	add_child(enemy);

func instantiate_line(level):
	var vertical_offset = 10
	var horizontal_offset = 385
	var horizontal_limit = 800
	
	var side_spacing = 50
	var vertical_spacing = 40
	var height = level*vertical_spacing + vertical_offset
	for x_pos in range(horizontal_offset, horizontal_limit, side_spacing):
		instantiate_enemy(Vector2(x_pos, height), level)
		
func instantiatee_swarm():
	var number_of_lines = 1
	for level in range(1,number_of_lines+1,1):
		instantiate_line(level)

func _ready():
	instantiatee_swarm()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
