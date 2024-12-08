class_name GameOver extends Node2D
var audio:AudioStreamPlayer
var vidas:int
var img = ["res://Tilemap/heart0.jpg","res://Tilemap/heart1.jpg","res://Tilemap/heart2.jpg","res://Tilemap/heart3.jpg"]
var corazones:Sprite2D
var label:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $ParallaxBackground/Label
	Hearts._reducirVida()
	vidas = Hearts._getVidas()
	$AnimatedSprite2D.play("GameOver")
	audio = $AudioStreamPlayer
	corazones = $Corazones
	corazones.texture = load(img[vidas])
	if(Hearts._getVidas()>0):
		label.text = "Continuar"
		$SiButton.show()
		$NoButton.show()
	else:
		label.text = "Game Over"
		$SiButton.hide()
		$NoButton.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _getVidas():
	return vidas


func _on_audio_stream_player_finished():
	audio.play()


func _on_si_button_pressed():
	match(Hearts._getNivelActual()):
		1:
			get_tree().change_scene_to_file("res://Scenes/Level 1/level_1.tscn")
		5:
			get_tree().change_scene_to_file("res://Scenes/Level 5/level_5.tscn")


func _on_no_button_pressed():
	$SiButton.hide()
	$NoButton.hide()
	$ParallaxBackground/Label.text = "Game Over"
