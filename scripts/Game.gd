extends Node2D

@onready var Swarm = get_node("Swarm")
@onready var Shields = get_node("Shields")
@onready var Player_controller = get_node("Player_controller")
@onready var Bonus_controller = get_node("Bonus_controller")

@onready var Level_clear_dialog = get_node("Level_clear_dialog")

@onready var life_up_audio = get_node("/root/World/Game_sounds/life_up")
@onready var level_up_audio = get_node("/root/World/Game_sounds/level_up")

func reset_globals():
	Global.level = 0
	Global.lives = 3
	Global.score = 0
	Global.extra_lives_earned = 0

func handle_extra_life():
	const EXTRA_LIFE_THRESHOLD = 2000
	if(Global.score >= Global.extra_lives_earned*EXTRA_LIFE_THRESHOLD + EXTRA_LIFE_THRESHOLD):
		Global.lives += 1
		Global.extra_lives_earned += 1
		life_up_audio.play()		

func score_points(new_points:int):
	Global.score += new_points
	handle_extra_life()

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
	level_up_audio.play()
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
