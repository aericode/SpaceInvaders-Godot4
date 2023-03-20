extends Node2D



func instantiate_brick(brick_position: Vector2):
	var brick_resource = preload("res://resources/Shield_block.tscn")
	var brick = brick_resource.instantiate()
	brick.position = brick_position
	get_node("/root/World").add_child(brick)


# Called when the node enters the scene tree for the first time.
func _ready():
	instantiate_brick(Vector2(300,300))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
