extends Area2D

@export var score_value = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func destroy_self():
	queue_free()

func detect_hit():
	if(has_overlapping_areas()):
		destroy_self()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	detect_hit()
