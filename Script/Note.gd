class_name Note extends RigidBody2D
# Esta es la planilla que usaremos
var speed: int
var dir: Vector2
var spriteNote = Sprite2D.new()
var colshape = CollisionShape2D.new()
var rect = RectangleShape2D.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = 10
	speed= 3000
	dir = Vector2(-1,0)
	#collision_layer = 2
	collision_mask = 1
	gravity_scale=0.0
	lock_rotation= true
	#60x60
	rect.size= Vector2(1,1)
	colshape.shape= rect
	add_child(spriteNote)
	add_child(colshape)
	
#print(Time.get_ticks_msec())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
#if(position.x<=0):
#print(Time.get_ticks_msec())


func _physics_process(delta):
	#impulso va aumentando la velocidad
	apply_central_force(dir*speed*delta)
	
func _destroy():
	queue_free()



func _on_area_2d_body_exited(_body):
	queue_free()
