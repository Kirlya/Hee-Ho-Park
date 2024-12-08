extends Node2D
var notas:Array
var timer:Timer
var indice = 0
#var auxtimer = [0.4]
var auxtimer = [0.4,3.4,0.9,0.5,5.6,1.2,5.7,1,2.1,0.3,0.3,6.85,2.7,0.3,1.4,3.6,0.8,5.5,1.9,0.8,0.8,2.7,0.3,3,0.9,3.5,1.1,0.3,0.3,0.3,9,4.3,0.8,5.3,0.9,0.6,3.6,0.3,1.7,1.8,2.8,1.4,7.2,0.9,0.9,3.55,0.3,0.3,0.3,2.8,0.6,4.4,0.9,2.6,3.4,1,0.9,6.3,5.3,3.6,1.8]

signal notaOut

func _ready():
	timer = get_node("TimerC")
	timer.start(auxtimer[0])

func _on_timer_timeout():
	var notaC = NoteCircle.new()
	notas.append(notaC)
	add_child(notaC)
	timer.stop()
	indice = indice + 1
	if(indice<auxtimer.size()):
		timer.start(auxtimer[indice])
	

func _on_hit_circle_body_exited(body):
	if(!notas.is_empty()):
		notaOut.emit()
		body.queue_free()
		notas.remove_at(notas.size()-1)



