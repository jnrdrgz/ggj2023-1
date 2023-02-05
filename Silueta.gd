extends Node2D

signal entered
signal exited
onready var anim_player = $AnimationPlayer

signal item_give(item)

func play_anim(anim):
	if anim_player.current_animation == anim:
		return
	anim_player.play(anim)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "In":
		emit_signal("entered")
	if anim_name == "Out":
		emit_signal("exited")


func _on_StoreItemArea_body_entered(body):
	print(body)
	body.get_parent().get_parent().reset()
	emit_signal("item_give", body.get_parent().get_parent().item)
