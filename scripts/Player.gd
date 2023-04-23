extends Area2D

@export var speed = 4 # How fast the player will move (pixels/sec).

@export var player_limit_begin = 0
@export var player_limit_end = 0

var bullet = null

var is_invincible:bool
var invincible_timer = 200

@onready var Player_controller = get_node("/root/World/Player_controller")


func _ready():
	get_invincible()

func get_invincible():
	is_invincible = true
	$AnimationPlayer.play("blinking")

func lose_invincible():
	is_invincible = false
	$AnimationPlayer.stop()
	$Sprite2D.set_material(null)

func handle_invincible_timer():
	if(invincible_timer <= 0):
		lose_invincible()
	else:
		invincible_timer-=1

func handle_movement():
	var input = 0
	if Input.is_action_pressed("right"):
		input = 1
	if Input.is_action_pressed("left"):
		input =-1
	position.x = clamp(position.x + input * speed, player_limit_begin, player_limit_end)

func spawn_bullet():
	var bullet_resource = preload("res://resources/Player_bullet.tscn")
	bullet = bullet_resource.instantiate()
	bullet.position = get_position() + Vector2(0,-5)
	get_node("/root/World").add_child(bullet)

func die():
	Player_controller.handle_death()
	queue_free()

func can_shoot():
	return bullet == null
	
func handle_shot():
	if(!is_invincible):
		die()
	
func handle_shooting():
	if (Input.is_action_just_pressed("shoot") && can_shoot()):
		spawn_bullet()

func _process(_delta):
	if(is_invincible):
		handle_invincible_timer()
	handle_movement()
	handle_shooting()
