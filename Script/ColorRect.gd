extends ColorRect
var randomr:RandomNumberGenerator
var timer:Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	randomr = RandomNumberGenerator.new()
	timer = get_child(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.


	


func _on_timer_timeout():
	color = Color(randf(),randf(),randf(),0.5)
	timer.start(1)
