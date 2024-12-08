extends Sprite2D
var img = ["res://Sprite/Concentracion/Vida1.png","res://Sprite/Concentracion/Vida2.png","res://Sprite/Concentracion/Vida3.png","res://Sprite/Concentracion/Vida4.png","res://Sprite/Concentracion/Vida5.png","res://Sprite/Concentracion/Vida6.png","res://Sprite/Concentracion/Vida7.png","res://Sprite/Concentracion/Vida8.png","res://Sprite/Concentracion/Vida9.png","res://Sprite/Concentracion/Vida10.png","res://Sprite/Concentracion/Vida11.png","res://Sprite/Concentracion/Vida12.png","res://Sprite/Concentracion/Vida13.png","res://Sprite/Concentracion/Vida14.png","res://Sprite/Concentracion/Vida15.png"]
var hp:int
var ganarhp:int
var penalizacion:int
var timer:Timer
var bandera: bool
var contadornotascorrectas:int
var combo:Combo
var comboaux:int
var maxcombo:int
var comboactual:int
var score:int

signal madBlackFrost
signal recuperarBackground
signal reducirBackground
signal eliminarfuego
# Called when the node enters the scene tree for the first time.
func _ready():
	comboactual = 0
	maxcombo = 0
	score = 0
	combo = $"../../Combo"
	penalizacion = 1
	ganarhp = 1
	timer = $AnimatedSprite2D/Timer
	hp = 0
	texture = load(img[hp])
	contadornotascorrectas = 0
	bandera = false
	call_deferred("setup")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _bajarconc():
	if(hp<img.length):
		hp=hp+penalizacion
		texture = load(img[hp])
		if(hp>=12):
			timer.start()
			$AnimatedSprite2D.play("Alert")
		
	#si no es asi debe mandar una señal quiere decir que pudo perder el juego
	
func setup():
	return
	
	
func _subirconc():
	if(hp>0):
		timer.start()
		$AnimatedSprite2D.play("Up")
		hp=hp-ganarhp
		texture = load(img[hp])
	if(hp==0):
		timer.start()
		$AnimatedSprite2D.play("Song")


func _on_timer_timeout():
	timer.stop()
	$AnimatedSprite2D.play("new_animation")
	
func _over():
	hide()
	get_tree().change_scene_to_file("res://Scenes/Resource/game_over.tscn")
			


func _on_player_bajar_vida():
	_romperCombo()
	madBlackFrost.emit()
	if(hp<img.size()-1):
		hp=hp + penalizacion
		#print("bad")
		combo._cambiarAnim("Bad")
		if(hp<img.size()-1):
			texture = load(img[hp])
		else: 
			_over()
		if(hp>=12):
			timer.start()
			$AnimatedSprite2D.play("Alert")


func _on_player_subir_vida():
	if(hp>0):
		timer.start()
		hp = hp - ganarhp
		$AnimatedSprite2D.play("Up")
		texture = load(img[hp])
	if(hp==0):
		timer.start()
		$AnimatedSprite2D.play("Song")
	_aumentarScore()
	if(comboaux==15):
		comboaux=0
		eliminarfuego.emit()
		recuperarBackground.emit()


func _on_note_generator_c_nota_out():
#	if(!bandera):
#		_on_player_bajar_vida()
#	bandera = false
	if(contadornotascorrectas == 0):
		_on_player_bajar_vida()
		reducirBackground.emit()
	else:
		contadornotascorrectas = contadornotascorrectas - 1


func _on_note_generator_s_nota_out():
#	if(!bandera):
#		_on_player_bajar_vida()
#	bandera = false
	if(contadornotascorrectas == 0):
		_on_player_bajar_vida()
		reducirBackground.emit()
	else:
		contadornotascorrectas = contadornotascorrectas - 1


#se suma tambien si la nota se elimina
func _on_note_generator_t_nota_out():
#	if(!bandera):
#		_on_player_bajar_vida()
#	bandera = false
	if(contadornotascorrectas == 0):
		_on_player_bajar_vida()
		reducirBackground.emit()
	else:
		contadornotascorrectas = contadornotascorrectas - 1



func _on_note_generator_x_nota_out():
#	if(!bandera):
#		_on_player_bajar_vida()
#	bandera = false
	if(contadornotascorrectas == 0):
		_on_player_bajar_vida()
		reducirBackground.emit()
	else:
		contadornotascorrectas = contadornotascorrectas - 1



func _on_player_bandera():
	contadornotascorrectas= contadornotascorrectas + 1
	#bandera = true

func _on_level_5_cambiarimg(vidainicial):
	texture = load(img[vidainicial])

func _aumentarScore():
	comboactual = comboactual + 1
	comboaux = comboaux + 1
	score = score + 100 + comboactual

func _romperCombo():
	if(comboactual>maxcombo):
		maxcombo = comboactual
	comboactual = 0
	comboaux = 0


func _on_audio_stream_player_2d_2_finished():
	Hearts._cargarCombo(maxcombo)
	Hearts._cargarScore(score)
	get_tree().change_scene_to_file("res://Scenes/Resource/stage_cleared.tscn")
