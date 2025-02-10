class_name controls_ui
extends Control
@onready var triangle: RichTextLabel = $Panel/VBoxContainer/Triangle
@onready var square: RichTextLabel = $Panel/VBoxContainer/HBoxContainer/Square
@onready var cross: RichTextLabel = $Panel/VBoxContainer/Cross
@onready var circle: RichTextLabel = $Panel/VBoxContainer/HBoxContainer/Circle
const TRIANGLE_NOTE = preload("res://Sprite/Note/triangle_note.png")
const SQUARE_NOTE = preload("res://Sprite/Note/square_note.png")
const CROSS_NOTE = preload("res://Sprite/Note/cross_note.png")
const CIRCLE_NOTE = preload("res://Sprite/Note/circle_note.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	triangle.add_image(TRIANGLE_NOTE)
	square.add_image(SQUARE_NOTE)
	cross.add_image(CROSS_NOTE)
	circle.add_image(CIRCLE_NOTE)
	addtextNote()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	$".".visible=false

#get the input keys
func getTextNotes(keys) -> String:
	var text = ""
	for key in keys:
		if(key is InputEventKey):
			text = text + OS.get_keycode_string(key.physical_keycode) + " "
	return text

#add the controls inputs in the label
func addtextNote():
	var keyTriangle = InputMap.action_get_events("ui_triangle")
	var keySquare = InputMap.action_get_events("ui_square")
	var keyCross = InputMap.action_get_events("ui_cross")
	var keyCircle = InputMap.action_get_events("ui_circle") 
	triangle.add_text(" %s " % getTextNotes(keyTriangle))
	square.add_text(" %s " % getTextNotes(keySquare))
	cross.add_text(" %s " % getTextNotes(keyCross))
	circle.add_text(" %s " % getTextNotes(keyCircle))
