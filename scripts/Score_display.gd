extends Label

func _process(_delta):
	self.text = "SCORE " + str(Global.score)
