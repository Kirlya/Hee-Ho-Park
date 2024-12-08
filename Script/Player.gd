extends Node2D

#var vida:int
var puntos:int
var combo:int
var comboFl:int
var areas: Array
var colisionarea:int
var puntNota:AnimatedSprite2D
var auxTimer:Timer

signal comboFlower
signal bajarVida
signal subirVida
signal bandera
signal reducirBackground

#probar un atributo boolean que empieze con verdadero y luego que la tecla se presione pase
#a falso y se vuelva verdadero una vez la tecla se suelte
#problema a futuro con notas dobles
#linea de area2d debe ser mas delgada


func _ready():
	areas = [$"../HitTriangle",$"../HitSquare",$"../HitCross",$"../HitCircle"]
	colisionarea = -1
	puntos = 0
	combo = 0
	auxTimer = $"../Combo/Timer"
	#vida = 16
	comboFl = 0
	puntNota=$"../Combo/AnimatedSprite2D"


func _input(event):
	if(event.is_pressed()):
		if(event.is_action_pressed("ui_square") || event.is_action_pressed("ui_cross") || event.is_action_pressed("ui_circle") || event.is_action_pressed("ui_triangle")):
			$"../AudioStreamPlayer2D".play()
			if(!event.is_echo()):
				if(event.is_action_pressed("ui_triangle")):
					_verificarNota(0,event)
				if(event.is_action_pressed("ui_square")):
					_verificarNota(1,event)
				if(event.is_action_pressed("ui_cross")):
					_verificarNota(2,event)
				if(event.is_action_pressed("ui_circle")):
					_verificarNota(3,event)
		if(event.is_action_pressed("ui_text_completion_accept")):
			get_tree().paused = true
			$"../Popup".popup()
			

#verificar mas notas en el area no la primera

func _verificarNota(n,event):
	if(_hayColision(n)):
		var nota = areas[n].get_overlapping_bodies()[0]
		if(nota.notaCorrecta(event)):
			combo = combo + 1
			comboFl = comboFl + 1
			#_subirVida()
			bandera.emit()
			subirVida.emit()
			puntNota.stop()
			puntNota.play("Cool")
			auxTimer.start(0.4)
			puntos = puntos + 1 
		nota.queue_free()
	else:
		if(_verificarAreas()):
			reducirBackground.emit()
	if(comboFl == 15):
		comboFl = 0
		comboFlower.emit()

#func _subirVida():
#	if(vida<16):
#		vida= vida + 1
		
		
func _hayColision(n)->bool:
	if(areas[n].has_overlapping_bodies()):
		return true
	return false

#falta descontar puntuacion si toca la nota incorrecta
func _notaIncorrecta(_n):
	pass

func _on_timer_timeout():
	puntNota.stop()
	puntNota.play("new_animation")
	
func _verificarAreas()->bool:
	for i in areas.size():
		if(areas[i].has_overlapping_bodies()):
			return true
	return false
