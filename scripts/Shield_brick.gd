extends Area2D

var current_health = 4

func get_sprite_based_on_health():
	var brick_sprite
	match current_health:
		4:
			brick_sprite = preload("res://assets/shield_bricks/brick100.png")
		3:
			brick_sprite = preload("res://assets/shield_bricks/brick75.png")
		2:
			brick_sprite = preload("res://assets/shield_bricks/brick50.png")
		1:
			brick_sprite = preload("res://assets/shield_bricks/brick25.png")
		var default:
			brick_sprite = null
	get_node("Sprite2D").texture = brick_sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func handle_shot():
	current_health -= 1
#	if(current_health <= 0):
#		queue_free()
#	else:
#		get_sprite_based_on_health()
	

func _on_area_entered(area):
	if(area.get_name()=="Payer_bullet" || area.get_name()=="Enemy_bullet"):
		pass
