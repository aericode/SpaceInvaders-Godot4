extends Label

func _process(_delta):
	self.text = "SCORE" + "\n" + str(Global.score) + "\n\n" + "LIVES" + "\n" + str(Global.lives) + "\n\n" + "LEVEL" + "\n" + str(Global.level)
