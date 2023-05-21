extends Node2D

@onready var Game = get_node("/root/World")


var delay_counter = 20
var can_quit_message = false

var exit_key: String = "shoot"
var call_next_level = false
var end_game = false
var message = ""

func start_delay_counter():
	delay_counter = 20
	can_quit_message = false 

func handle_screen_open_delay():
	if(delay_counter >0):
		delay_counter -=1
	else:
		can_quit_message = true

func configure_resume_actions(menu_type:String):
	if(menu_type == "pause"):
		exit_key = "escape"
		call_next_level = false
		end_game = false
		message = "PAUSED"
	elif(menu_type == "level_up"):
		exit_key = "shoot"
		call_next_level = true
		end_game = false
		message = "LEVEL CLEAR!"
	elif(menu_type == "game_over"):
		exit_key = "escape"
		call_next_level = false
		end_game = true
		message = "GAME OVER"
	else:
		push_error("warning: invalid pause menu type action")

func update_message_label():
	var display_key
	if(exit_key == "shoot"):
		display_key = "SPACE"
	if(exit_key == "escape"):
		display_key = "ESC"
	get_node("Message_label").text = message + "\n\n" + "press " + display_key + " to continue"

func display_dialog(menu_type: String):
	configure_resume_actions(menu_type)
	start_delay_counter()
	visible = true
	get_tree().paused = true
	update_message_label()

func handle_resume_action():
	if(call_next_level):
		Game.set_next_stage()
	elif(end_game):
		get_tree().change_scene_to_file("res://screens/Main_menu.tscn")

func handle_exit_key_press():
	if(exit_key!= "shoot" && exit_key != "escape"):
		push_warning("warning: invalid exit key for pause menu")
	if(visible && Input.is_action_just_pressed(exit_key)):
		visible = false
		get_tree().paused = false
		handle_resume_action()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_screen_open_delay()
	if(can_quit_message):
		handle_exit_key_press()
