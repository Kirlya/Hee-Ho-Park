extends Node2D
var notas:Array
var timer:Timer
var indice = 0
#var auxtimer = [3.775]
var auxtimer = [3.6,1.4,4.2,3.2,3,0.9,1.2,1.5,3.2,0.8,3,0.3,0.3,1.4,7.1,0.3,3,0.6,8,0.3,4.2,4.6,4.8,0.3,0.3,0.3,4.6,4.6,1.1,5,5.2,0.3,7.3,1.4,1.7,0.3,0.3,3,0.6,3,5.05,0.3,0.3,0.3,0.8,0.6,3.5,0.3,2.1,3.2,0.9,0.9,8.1,5.3,2.7]

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
