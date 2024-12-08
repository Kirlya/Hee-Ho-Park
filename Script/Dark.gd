extends Node2D
var array: Array
var index:int
# Called when the node enters the scene tree for the first time.
func _ready():
	array = get_children()
	index = 0
	for i in array.size():
		array[i].hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _mostrarSombra():
	array[index].show()
	if(index<array.size()-1):
		index = index + 1
		
func _esconderSombra():
	array[index].hide()
	if(index>0):
		index = index - 1
