extends Node2D

@onready var Game = get_node("/root/World")

var exit_key: String = "shoot"

var delay_counter = 20
var can_quit_message = false
var call_next_level = false

func start_delay_counter():
	delay_counter = 20
	can_quit_message = false 

func handle_screen_open_delay():
	if(delay_counter >0):
		delay_counter -=1
	else:
		can_quit_message = true

func display_dialog(message: String, exit_key:String, call_next_level = false):
	start_delay_counter()
	visible = true
	get_tree().paused = true
	self.call_next_level = call_next_level
	var display_key
	self.exit_key = exit_key
	if(exit_key == "shoot"):
		display_key = "SPACE"
	if(exit_key == "escape"):
		display_key = "ESC"
	get_node("Message_label").text = message + "\n\n" + "press " + display_key + " to continue"


func handle_exit_key_press():
	if(exit_key!= "shoot" && exit_key != "escape"):
		push_warning("warning: invalid exit key for pause menu")
	if(visible && Input.is_action_just_pressed(exit_key)):
		visible = false
		get_tree().paused = false
		if(call_next_level):
			Game.set_next_stage()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_screen_open_delay()
	if(can_quit_message):
		handle_exit_key_press()
