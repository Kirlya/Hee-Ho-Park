extends Node2D
var cantFlower:int
var count:int
var flores:Array
# Called when the node enters the scene tree for the first time.
func _ready():
	count = 0
	cantFlower = get_node("Background/Flores").get_children().size()
	flores = get_node("Background/Flores").get_children(true)
	_ocultar()
	#$Background/Arbustos/Arbusto2.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_player_combo_flower():
	if(count<cantFlower):
		flores[count]._visible()
		count = count + 1
		
func _ocultar():
	get_node("Background/Arboles").set_visible(false)
	get_node("Background/Arbustos").set_visible(false)
	get_node("Background/Flores/Flor").play("muerta")
	get_node("Background/Flores/Flor2").play("muerta")
	get_node("Background/Flores/Flor3").play("muerta")
	get_node("Background/Flores/Flor4").play("muerta")
	get_node("Background/Flores/Flor5").play("muerta")
	get_node("Background/Flores/Flor6").play("muerta")
	get_node("Background/Flores/Flor7").play("muerta")
	get_node("Background/Flores/Flor8").play("muerta")
	get_node("Background/Flores/Flor9").play("muerta")
	get_node("Background/Flores/Flor10").play("muerta")
	get_node("Background/Flores/Flor11").play("muerta")

# cambiar de escena
func _on_audio_stream_player_2d_2_finished():
	pass # Replace with function body.


func _on_timer_iniciar_timeout():
	pass # Replace with function body.
