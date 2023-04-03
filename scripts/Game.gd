extends Node2D

@onready var Swarm = get_node("Swarm")
@onready var Shields = get_node("Shields")
@onready var Player_controller = get_node("Player_controller")
@onready var Bonus_controller = get_node("Bonus_controller")


func reset_game():
	Player_controller.respawn_player()
	Swarm.instantiate_swarm()
	Shields.instantiate_shield_set()
	Bonus_controller.set_random_timer()




func _ready():
	Player_controller.respawn_player()
	Swarm.instantiate_swarm()
	Shields.instantiate_shield_set()
	Bonus_controller.set_random_timer()
