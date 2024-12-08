extends Node2D
var notas:Array
var timer:Timer
var indice = 0

var auxtimer = [1.504,1.116,1.769,2.577,2.923,4.384,2.462,0.385,2.23,0.731,1.808,0.346,0.769,0.693,2.123,0.347,0.346,2.192,0.423,0.346,5.154,0.308,0.384,0.77,0.692,2.192,0.693,1.846,0.346,0.692,2.192,1.731,0.423,2.231,2.192,0.731,2.192,0.731,3.577,0.346,0.423,1.5,0.693,1.769,2.577,2.192,2.154,0.192,0.346,3.116,0.731,1.461,1.423,4.385,0.192,0.346,2.77,0.692,2.154,0.73,2.347,0.384,0.154,0.231,0.154,1.384,0.962,0.192,0.231,0.192,0.5]

# Called when the node enters the scene tree for the first time.
signal notaOut

func _ready():
	timer = get_node("TimerX")
	timer.start(auxtimer[0])


func _on_timer_timeout():
	var notaX = NoteCross.new()
	notas.append(notaX)
	add_child(notaX)
	timer.stop()
	indice = indice + 1
	if(indice<auxtimer.size()):
		timer.start(auxtimer[indice])

func _on_hit_cross_body_exited(body):
	if(!notas.is_empty()):
		notaOut.emit()
		body.queue_free()
		notas.remove_at(notas.size()-1)
