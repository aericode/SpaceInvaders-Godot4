extends Node2D

@export var is_enemy:bool = false
var move_direction

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += Vector2(0,-10)

