extends Node2D

@onready var is_respawning = false
const RESPAWN_TIME =  200
const RESPAWN_POSITION = Vector2(580, 615)
var player_respawn_timer = 0

func respawn_player():
	var player_resource = preload("res://resources/Player.tscn")
	var player = player_resource.instantiate()
	player.position = RESPAWN_POSITION
	add_child(player)
	is_respawning = false
	
func prepare_respawn():
	is_respawning = true
	player_respawn_timer = RESPAWN_TIME

func handle_respawn_timer():
	if(player_respawn_timer <= 0):
		respawn_player()
	else:
		player_respawn_timer -= 1

func handle_gameover():
	pass

func handle_death():
	Global.lives -= 1
	if(Global.lives <=0):
		handle_gameover()
	else:
		prepare_respawn()

func _process(_delta):
	if(is_respawning):
		handle_respawn_timer()
