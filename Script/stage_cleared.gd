extends Node2D
var combotext:Label
var scoretext:Label
var nivellabel:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	nivellabel = $ParallaxBackground/Sprite2D/Nivel
	combotext = $ParallaxBackground/Sprite2D/ComboText
	scoretext = $ParallaxBackground/Sprite2D/ScoreText
	nivellabel.text = str("Nivel ",Hearts._getNivelActual())
	scoretext.text = String.num_int64(Hearts._mostrarScore())
	combotext.text = String.num_int64(Hearts._mostrarCombo())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
