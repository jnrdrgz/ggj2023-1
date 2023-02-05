extends Node2D

export (Global.store_item) var item = Global.store_item.CERVE

var pressing = false
var original_pos
func _ready():
	original_pos = $Sprite.global_position
	if item == Global.store_item.CERVE:
		$Sprite.texture = load("res://assets/cerve.png")
	if item == Global.store_item.CIGA:
		$Sprite.texture = load("res://assets/ciga.png")

func _process(delta):
	if pressing:
		var mouse_pos = get_viewport().get_mouse_position()
		$Sprite.global_position = Vector2(mouse_pos.x-50,mouse_pos.y-50) 


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		pressing = true
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		reset()

func reset():
	pressing = false
	$Sprite.global_position = original_pos
