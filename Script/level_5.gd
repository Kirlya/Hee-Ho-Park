extends Node2D

signal cambiarimg

#maxima vida 16
var vidainicial:int 
var penalizacionvida:int
var ganarvida:int

# Called when the node enters the scene tree for the first time.
func _ready():
	Hearts._setNivelActual(5)
	vidainicial = 12
	ganarvida = 1
	penalizacionvida = 3
	var mind = $Mind/Mind
	mind.ganarhp= ganarvida
	mind.penalizacion = penalizacionvida
	mind.hp = vidainicial
	cambiarimg.emit(vidainicial)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_combo_flower():
	pass # Replace with function body.



func _on_timer_inicial_timeout():
	$AudioStreamPlayer2D2.play()
