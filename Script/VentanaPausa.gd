extends Popup
var anim: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = $AnimatedSprite2D
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_window_input(event):
	if(event.is_action_pressed("ui_text_completion_accept")):
			hide()
			get_tree().paused = false
