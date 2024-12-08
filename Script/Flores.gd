extends Node2D
var flores:Array
var index:int
# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	flores = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_background_eliminar_flor():
	if(index<flores.size()):
		flores[index]._invisible()
		index = index + 1

func _getIndex():
	return index - 1


func _on_background_recuperar_flor():
	if(index>0):
		index = index - 1
		flores[index]._visible()
