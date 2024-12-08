extends Node2D
var fuegos:Array
var audio:AudioStreamPlayer2D
var timer:Timer
var index:int
# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	fuegos = get_children()
	for i in fuegos.size()-2:
		fuegos[i].hide()
	timer = $TimerFuego
	audio = $AudioStreamPlayer2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_incendio_timeout():
	audio.play()
	timer.start(2.5)


func _on_timer_fuego_timeout():
	if(index<fuegos.size()-2):
		fuegos[index].show()
		index = index + 1


func _on_mind_eliminarfuego():
	if(index>0):
		index = index - 1
	fuegos[index].hide()


func _on_audio_stream_player_2d_finished():
	audio.play()
