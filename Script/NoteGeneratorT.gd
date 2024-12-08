extends Node2D
var notas:Array
var timer:Timer
var indice = 0
#var auxtimer = [2.317,0.875]
var auxtimer = [2,1,3.8,0.3,0.3,6.15,0.3,3,2.7,7.9,2.6,1.6,0.3,6.2,0.6,8.9,0.4,2.6,4,4.6,3.6,0.3,0.3,0.4,6.4,4.1,0.9,0.3,0.3,0.3,4.5,0.9,7,3.5,2.8,0.6,1,0.5,4,8.15,0.6,0.9,0.3,4.1,8.9,0.8,0.8,8,1.8]

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
