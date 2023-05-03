extends Node2D

@onready var Swarm = get_node("Swarm")
@onready var Shields = get_node("Shields")
@onready var Player_controller = get_node("Player_controller")
@onready var Bonus_controller = get_node("Bonus_controller")

@onready var Level_clear_dialog = get_node("Level_clear_dialog")

func reset_globals():
	Global.level = 0
	Global.lives = 3
	Global.score = 0

func reset_game():
	reset_globals()
	Player_controller.respawn_player()
	Swarm.reset_swarm()
	Shields.instantiate_shield_set()
	Bonus_controller.set_random_timer()

func show_level_clear_dialog():
	Level_clear_dialog.visible = true;
	get_tree().paused = true
	
func level_up():
	show_level_clear_dialog()

func set_next_stage():
	Swarm.reset_swarm()
	Bonus_controller.set_random_timer()
	Global.level += 1


func handle_game_over():
	get_tree().change_scene_to_file("res://screens/Game_over.tscn")

func _ready():
	reset_game()
	
func _process(_delta):
	if(Global.lives == 0):
		handle_game_over()
