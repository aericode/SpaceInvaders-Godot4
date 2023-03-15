extends Area2D

@export var is_enemy:bool = false
var move_direction

func _ready():
	if(is_enemy):
		get_node("Sprite2D").self_modulate = Color(0, 1, 0)

func _physics_process(delta):
	position += Vector2(0,-10)
	if(has_overlapping_areas()):
		queue_free()
