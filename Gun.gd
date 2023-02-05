extends Node2D

signal gun_shooted

func _ready():
	pass # Replace with function body.


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("gun_shooted")
