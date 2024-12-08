extends Label
var texto:String

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Hearts._getVidas()>0):
		text = "Continuar?"
	else:
		text = "Game Over"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
