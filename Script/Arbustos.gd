extends Node2D
var arbustos:Array
var index:int

# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	arbustos = get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_background_eliminar_arbusto():
	if(index<arbustos.size()):
		arbustos[index]._invisible()
		index = index + 1

func _getIndex():
	return index - 1


func _on_background_recuperar_arbusto():
	if(index>0):
		index = index - 1
		arbustos[index]._visible()
