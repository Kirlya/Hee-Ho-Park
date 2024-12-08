extends Node2D
var notas:Array
var timer:Timer
var indice = 0

var auxtimer = [1.12,2.961,3.231,1.115,1.808,1.115,0.731,2.912,0.387,0.154,5.308,0.538,5.932,0.769,3.654,0.346,0.346,3.693,0.692,2.192,1.269,2.308,2.923,0.5,2.385,2.961,0.731,5.077,0.731,6.577,0.731,3.576,2.347,0.153,0.154,0.27,2.538,1.115,1.462,2.154,3.807,0.154,0.154,0.231,3.308,0.73,1.077,0.731,0.731,2.692,0.846,0.962,0.192,0.231,0.192,0.5]

signal notaOut

func _ready():
	timer = get_node("TimerS")
	timer.start(auxtimer[0])

func _on_timer_timeout():
	var notaS = NoteSquare.new()
	notas.append(notaS)
	add_child(notaS)
	timer.stop()
	indice = indice + 1
	if(indice<auxtimer.size()):
		timer.start(auxtimer[indice])


func _on_hit_square_body_exited(body):
	if(!notas.is_empty()):
		notaOut.emit()
		body.queue_free()
		notas.remove_at(notas.size()-1)
