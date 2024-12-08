class_name Combo extends Sprite2D

var animNote:AnimatedSprite2D
var timer:Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	animNote = $AnimatedSprite2D
	animNote.play("new_animation")
	timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _cambiarAnim(anim):
	animNote.stop()
	animNote.play(anim)
	timer.start(0.4)


func _on_timer_timeout():
	animNote.stop()
	animNote.play("new_animation")
