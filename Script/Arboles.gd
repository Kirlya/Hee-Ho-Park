extends Node2D
var arboles:Array
var index:int


# Called when the node enters the scene tree for the first time.
func _ready():
	arboles = $".".get_children()
	index = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_background_reducirvida_arbol():
	#el ultimo es el unico arbol que no se puede borrar
	if(index<arboles.size()-1):
		arboles[index]._reducir_vida()
		if(arboles[index]._mostrarVida()==0):
			index = index + 1



func _on_background_recuperarvida_arbol():
	var aux = arboles.size()-2
	while(arboles[aux]._mostrarVida()==4 && aux>0):
		aux = aux - 1
	if(arboles[aux]._mostrarVida()<4):	
		arboles[aux]._aumentar_vida()
