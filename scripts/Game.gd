extends Node2D

var enemy_resource = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy = enemy_resource.instantiate()
	enemy.set_position(Vector2(100,100))
	add_child(enemy);
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
