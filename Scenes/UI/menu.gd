class_name menu
extends Control
@onready var iniciar_button: Button = $BoxContainer/VBoxContainer/HBoxContainer/Iniciar_Button as Button
@onready var cargar_button: Button = $BoxContainer/VBoxContainer/HBoxContainer/Cargar_Button as Button
@onready var config_button: Button = $BoxContainer/VBoxContainer/HBoxContainer/Config_Button as Button
@onready var controles_button: Button = $BoxContainer/VBoxContainer/HBoxContainer2/Controles_Button as Button
@onready var salir_button: Button = $BoxContainer/VBoxContainer/HBoxContainer2/Salir_Button as Button
@onready var controls_ui: controls_ui = $Controls_UI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_iniciar_button_button_down() -> void:
	pass # Replace with function body.
	
	
func _on_cargar_button_button_down() -> void:
	pass # Replace with function body.


func _on_config_button_button_down() -> void:
	pass # Replace with function body.


func _on_controles_button_button_down() -> void:
	controls_ui.visible= true;


func _on_salir_button_button_down() -> void:
	get_tree().quit()
