extends Node2D
var notas:Array
var timer:Timer



func _on_timer_timeout():
	var notaS = NoteSquare.new()
	notas.append(notaS)
	add_child(notaS)


func _on_hit_square_body_exited(body):
	if(!notas.is_empty()):
		body.queue_free()
		notas.remove_at(notas.size()-1)



