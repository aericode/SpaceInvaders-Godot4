extends Area2D

var timer = 0
@onready var bonus_controller = get_node("/root/World/Bonus_controller")

func move():
	var movement_vector = Vector2(-2,0)
	position += movement_vector

func handle_screen_limit():
	if(timer >= 360):
		bonus_controller.on_ship_removed()
		queue_free()

func update_timer():
	timer +=1

func calculate_score():
	return (6 - ceil(timer/60))*50

func die():
	bonus_controller.on_ship_removed()
	Global.score += calculate_score()
	queue_free()

func _on_area_entered(area):
	if(area.get_name()=="Player_bullet"):
		die()


func _process(delta):
	update_timer()
	handle_screen_limit()
	move()


