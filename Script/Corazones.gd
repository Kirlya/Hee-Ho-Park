extends Sprite2D
var img = ["res://Tilemap/heart0.jpg","res://Tilemap/heart1.jpg","res://Tilemap/heart2.jpg","res://Tilemap/heart3.jpg"]
var vidas:int
var gameOver:GameOver
# Called when the node enters the scene tree for the first time.
func _ready():
	gameOver = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
