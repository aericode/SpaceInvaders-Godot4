extends Area2D

var timer = 0

func move():
	var movement_vector = Vector2(-2,0)
	position += movement_vector

func handle_screen_limit():
	const screen_limit = 225
	if(position.x < screen_limit):
		queue_free()

func update_timer():
	timer +=1

func calculate_score(timer):
	return (6 - ceil(timer/72))*50

func _process(delta):
	handle_screen_limit()
	move()
