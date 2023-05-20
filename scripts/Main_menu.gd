extends Node2D

@onready var Hi_score_manager = get_node("Hi_score_manager")
@onready var Hi_score_display = get_node("Hi_score_display")

@onready var Game_start_banner = get_node("Game_start_banner")

var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Hi_score_manager.handle_save_file_exists()
	Hi_score_manager.handle_scores_loaded()
	Hi_score_display.text = "[center]" + str(Global.hi_score) +"[/center]"
	
	set_repeater()



func _process(delta):
	if (Input.is_action_just_pressed("shoot")):
		get_tree().change_scene_to_file("res://screens/World.tscn")

func set_repeater():
	timer.connect("timeout",self.do_this)
	timer.wait_time = 1
	timer.one_shot = true
	add_child(timer)
	timer.start()

func do_this():
	Game_start_banner.visible = !Game_start_banner.visible
	set_repeater()
