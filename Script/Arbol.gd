extends Sprite2D
var vida:int
var timer:Timer
var transicion:String
#var img = ["res://Background/Tree/Tree4.png","res://Background/Tree/Tree3.png","res://Background/Tree/Tree2.png","res://Background/Tree/Tree1.png","res://Background/Tree/Treefullhp.png"]
var anim:AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	vida=4
	transicion = "3"
	anim = get_child(0)
	anim.play("4")
	timer = anim.get_child(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _reducir_vida():
#	if(vida>0):
#		vida=vida - 1
#		timer.start(1.6)
#		texture = load(img[vida])
	match(vida):
		1:
			anim.stop()
			anim.play("1 a 0")
			transicion = "0"
			timer.start(1.6)
		2:
			anim.stop()
			anim.play("2 a 1")
			transicion = "1"
			timer.start(1.6)
		3: 
			anim.stop()
			anim.play("3 a 2")
			transicion = "2"
			timer.start(1.6)
		4:
			anim.stop()
			anim.play("4 a 3")
			transicion = "3"
			timer.start(1.6)
	if(vida>0):
		vida = vida - 1
	
func _aumentar_vida():
	match(vida):
		0:
			anim.stop()
			anim.play("1 a 0")
			transicion = "1"
			timer.start(1.6)
		1:
			anim.stop()
			anim.play("2 a 1")
			transicion = "2"
			timer.start(1.6)
		2: 
			anim.stop()
			anim.play("3 a 2")
			transicion = "3"
			timer.start(1.6)
		3:
			anim.stop()
			anim.play("4 a 3")
			transicion = "4"
			timer.start(1.6)
	if(vida<4):
		vida = vida + 1
	

func _cargarVida(num):
#	if(num>=0 && num<img.size()):
#		texture = load(img[num])
	vida = num
	anim.stop()
	match(vida):
		1:
			anim.play("1")
		2: 
			anim.play("2")
		3:
			anim.play("3")
		4:
			anim.play("4")
		0:
			anim.play("0")
	
func _mostrarVida()->int:
	return vida


func _on_timer_timeout():
	anim.stop()
	anim.play(transicion)
