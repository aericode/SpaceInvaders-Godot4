extends Node2D

@onready var Swarm = get_node("Swarm")
@onready var Shields = get_node("Shields")
@onready var Player_controller = get_node("Player_controller")

	
func _ready():
	Player_controller.prepare_respawn()
	Swarm.instantiate_swarm()
	Shields.instantiate_shield_set()
