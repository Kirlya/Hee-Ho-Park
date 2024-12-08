class_name Vidas extends Node
var vidas:int
var maxcombo:int
var score:int
var nivelactual:int

# Called when the node enters the scene tree for the first time.
func _init():
	nivelactual = 1
	vidas = 3
	maxcombo = 0
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _reducirVida():
	vidas = vidas - 1

func _getVidas():
	return vidas
	
func _reiniciarCombo():
	maxcombo = 0
	score = 0

func _mostrarCombo():
	return maxcombo

func _mostrarScore():
	return score
	
func _cargarCombo(newcombo):
	maxcombo = newcombo

func _cargarScore(newscore):
	score = newscore

func _getNivelActual():
	return nivelactual

func _setNivelActual(nivel):
	nivelactual = nivel
