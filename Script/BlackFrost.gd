extends RigidBody2D
var anim: AnimatedSprite2D
var timer:Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = $AnimatedSprite2D
	anim.play("idle")
	timer = $AnimatedSprite2D/Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mind_mad_black_frost():
	anim.stop()
	anim.play("apuntar")
	timer.start(1)
	


func _on_timer_timeout():
	anim.stop()
	anim.play("evil")
