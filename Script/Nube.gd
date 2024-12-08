extends Sprite2D
var speed:int
# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	speed = random.randi()%70 + 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x= position.x - speed * delta
	if(position.x <= -200):
		position.x = 1400
