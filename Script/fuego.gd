extends Node2D
var anim: AnimationPlayer
var sprite:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = $AnimationPlayer
	anim.play("new_animation")
	#anim

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	anim.play("new_animation")
