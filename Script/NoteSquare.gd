class_name NoteSquare extends Note

var img: CompressedTexture2D
# Called when the node enters the scene tree for the first time.
func _ready():
	img = load("res://Sprite/Note/square_note.png")
	spriteNote.texture= img
	super()


#crear una funcion que retorne verdadero o falso
func notaCorrecta(event)->bool: 
	if event.is_action_pressed("ui_square"):
		return true
	else: 
		return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
