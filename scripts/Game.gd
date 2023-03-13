extends Node2D

var enemy_resource = preload("res://enemy.tscn")

func instantiate_enemy(position:Vector2, level):
	var enemy = enemy_resource.instantiate()
	enemy.set_position(position)
	enemy.score_value =  (5-level)*100
	add_child(enemy);

func instantiate_line(level):
	var offset = 10
	var side_spacing = 50
	var vertical_spacing = 40
	var height = level*vertical_spacing + offset
	for x_pos in range(100, 700, side_spacing):
		instantiate_enemy(Vector2(x_pos, height), level)
		
func instantiatee_swarm():
	for level in range(1,5,1):
		instantiate_line(level)

func _ready():
	instantiatee_swarm()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
