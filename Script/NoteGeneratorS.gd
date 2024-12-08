extends Node2D
var notas:Array
var timer:Timer
var indice = 0
#var auxtimer = [1.359,2.125]

var auxtimer = [1.3,2,2.4,2.6,4.4,1.5,0.3,2.7,2.1,5.6,2.85,1.4,4.4,0.9,0.3,5,0.9,8.7,0.3,1.4,4.6,4.3,4.9,0.4,0.3,3.2,0.3,1.6,2.9,5.5,0.6,4.5,6.1,1.4,3,0.5,5.4,1.5,0.3,0.3,6.2,0.6,4.3,8.2,0.3,0.3,0.3,6.2,0.9,0.9,6.2]

signal notaOut

func _ready():
	timer = get_node("TimerS")
	timer.start(auxtimer[0])

func _on_timer_s_timeout():
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
