extends Node2D

@onready var is_respawning = false
const RESPAWN_TIME =  300
const RESPAWN_POSITION = Vector2(580, 615)
var player_respawn_timer = 0

func respawn_player():
	var player_resource = preload("res://resources/Player.tscn")
	var player = player_resource.instantiate()
	player.position = RESPAWN_POSITION
	add_child(player)

func prepare_respawn():
	is_respawning = true
	player_respawn_timer = RESPAWN_TIME


func _process(delta):
	pass
