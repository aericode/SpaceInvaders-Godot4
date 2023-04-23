extends Label

@export var isDisplayLives:bool;

func _process(_delta):
	var lives_display_text = ""
	if(isDisplayLives):
		lives_display_text = "\n\n" + "LIVES" + "\n" + str(Global.lives);
	self.text = "SCORE" + "\n" + str(Global.score) + lives_display_text + "\n\n" + "LEVEL" + "\n" + str(Global.level)
