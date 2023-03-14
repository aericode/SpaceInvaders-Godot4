extends Node2D

var enemy_resource = preload("res://scenes/enemy.tscn")

func instantiate_enemy(position:Vector2, line_index):
	var enemy = enemy_resource.instantiate()
	var enemy_sprite
	
	enemy.set_position(position)
	if(line_index == 1):
		enemy.score_value =  40
		enemy_sprite = load("res://assets/red.png")
	if(line_index == 2 || line_index == 3):
		enemy.score_value =  20
		enemy_sprite = load("res://assets/yellow.png")
	if(line_index == 4 || line_index == 5):
		enemy.score_value =  10
		enemy_sprite = load("res://assets/green.png")
	
	enemy.get_node("Sprite2D").texture = enemy_sprite
	
	add_child(enemy);

func instantiate_line(level):
	var vertical_offset = 20
	var horizontal_offset = 300
	var horizontal_limit = 900
	
	var side_spacing = 55
	var vertical_spacing = 48
	var height = level*vertical_spacing + vertical_offset
	for x_pos in range(horizontal_offset, horizontal_limit, side_spacing):
		instantiate_enemy(Vector2(x_pos, height), level)
		
func instantiatee_swarm():
	var number_of_lines = 5
	for level in range(1,number_of_lines+1,1):
		instantiate_line(level)

func _ready():
	instantiatee_swarm()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
