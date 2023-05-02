extends Label

func _ready():
	self.text = "HI-SCORE" + "\n" + str(Global.hi_score)
