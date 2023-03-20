extends Node2D

@onready var Swarm = get_node("Swarm")
@onready var Shields = get_node("Shields")

func instantiate_player():
	var player_resource = preload("res://resources/Player.tscn")
	var player = player_resource.instantiate()
	player.position = Vector2(590, 615)
	add_child(player)


func _process(_delta):
	pass
	
func _ready():
	Swarm.instantiate_swarm()
	Shields.instantiate_half_line(Vector2(590, 515))
	instantiate_player()
