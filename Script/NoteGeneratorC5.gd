extends Node2D
var notas:Array
var timer:Timer
var indice = 0

var auxtimer = [1.85,2.923,1.5,2.924,3.615,0.346,0.385,2.346,0.115,0.193,0.192,5.5,0.346,6.47,0.423,0.346,0.769,0.693,9.731,0.115,0.192,0.154,2.154,0.769,2.423,0.423,3,0.308,0.385,5.077,0.346,0.384,2.154,0.346,0.423,0.731,2,1.231,0.385,2.923,0.692,5.269,0.192,0.193,0.231,0.307,1.116,0.73,2.923,5.385,0.154,1.731,0.692,4.077,0.192,0.154,2.769,2.077]
# Called when the node enters the scene tree for the first time.
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
