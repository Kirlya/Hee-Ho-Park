extends Timer
var x:float

# Called when the node enters the scene tree for the first time.
func _ready():
	x=0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timeout():
	x= x + 0.01
