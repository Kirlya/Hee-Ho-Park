class_name Flor extends AnimatedSprite2D
var timer:Timer
var invisible:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_child(0)
	play("viva")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
func _invisible():
	#set_visible(false)
	invisible = true
	stop()
	play("desaparecer")
	timer.start(1.6)

func _visible():
	#set_visible(true)
	invisible = false
	stop()
	play("desaparecer")
	timer.start(1.6)


func _on_timer_timeout():
	if(invisible):
		stop()
		play("muerta")
	else:
		stop()
		play("viva")
