extends Node2D
var notas:Array
var timer:Timer
var indice = 0

var auxtimer = [0.35,3.002,2.154,2.193,2.884,7.269,0.731,2.231,0.538,3.047,0.77,0.653,0.347,0.346,6.615,0.769,3.616,0.346,0.346,1.462,0.576,3.039,2.192,0.5,1.693,5.115,0.308,0.384,6.577,0.769,1.577,0.193,0.153,0.154,0.77,5.807,2.577,0.154,2,0.385,0.73,1.462,2.154,0.807,0.693,0.769,2.962,0.192,0.231,0.23,2.116,0.731,1.807,0.385,2.692,1.423]
# Called when the node enters the scene tree for the first time.
signal notaOut

func _ready():
	timer = get_node("TimerT")
	timer.start(auxtimer[0])

func _on_timer_timeout():
	var notaT = NoteTriangle.new()
	notas.append(notaT)
	add_child(notaT)
	timer.stop()
	indice = indice + 1
	if(indice<auxtimer.size()):
		timer.start(auxtimer[indice])

func _on_hit_triangle_body_exited(body):
	if(!notas.is_empty()):
		notaOut.emit()
		body.queue_free()
		notas.remove_at(notas.size()-1)
