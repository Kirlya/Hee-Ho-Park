extends Node2D
var arboles:Array
var arbustos:Array
var flores:Array
var random:RandomNumberGenerator
var numero:int

signal eliminarFlor
signal eliminarArbusto
signal reducirvidaArbol
signal recuperarvidaArbol
signal recuperarFlor
signal recuperarArbusto

# Called when the node enters the scene tree for the first time.
func _ready():
	numero = 0
	random = RandomNumberGenerator.new()
	arboles = get_node("Arboles").get_children()
	arbustos = get_node("Arbustos").get_children()
	flores = get_node("Flores").get_children()
	_cargarArboles()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta):
	pass


func _on_player_reducir_background():
	numero = random.randi()%3
	if(numero == 0):
		eliminarFlor.emit()
	if(numero == 1):
		eliminarArbusto.emit()
	if(numero == 2):
		reducirvidaArbol.emit()
	
func _cargarArboles():
	for i in (arboles.size()-1):
		arboles[i]._cargarVida(2)


func _on_mind_reducir_background():
	_on_player_reducir_background()


func _on_mind_recuperar_background():
	recuperarArbusto.emit()
	recuperarvidaArbol.emit()
	recuperarFlor.emit()
