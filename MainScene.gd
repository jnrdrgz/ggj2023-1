extends Node2D

var rng = RandomNumberGenerator.new()
var discarded_faces = []

var game_state = "game_not_started"

var customers_to_kill = [
]

var customers = [
]

var can_play = true
var can_show_face_again = true
var customer_is_killer =  false

func get_rand_in_range_array(array):
	return array[rng.randi_range(0,len(array)-1)]

func generate_random_face():
	pass

func generate_random_customer():
	var folder = rng.randi_range(1,2)
	var n_img = rng.randi_range(1,6)
	
	
	var hombre = rng.randi_range(1,2) == 1
	
	var folder_sub = "h"
	if not hombre: folder_sub = "m"
	
	var nombre = get_rand_in_range_array(Global.nombs_h)
	if not hombre: nombre = get_rand_in_range_array(Global.nombs_m)
	
	var customer = {
		"id": rng.randi(),
		"name": "%s %s" % [nombre, get_rand_in_range_array(Global.aps)], 
		"profesion": get_rand_in_range_array(Global.profesiones), 
		"nacionalidad": get_rand_in_range_array(Global.nacionalidades), 
		"face": "%s/%s/%s" % [folder, folder_sub, n_img],
		"wait_time": 15*Global.difficulty,
		"dialog": get_rand_in_range_array(Global.dialogs),
		"info": get_rand_in_range_array(Global.infos),

		"nacionalidad_answer": get_rand_in_range_array(Global.nacionalidad_answers), 
		"profesion_answer": get_rand_in_range_array(Global.profesion_answers), 
		"nombre_answer": get_rand_in_range_array(Global.nombre_answers), 
		
		"want": get_rand_in_range_array(Global.store_items_str), 
	}

	customer["dialog"] = customer["dialog"].replace("%want%", customer["want"])
	
	customer["nacionalidad_answer"] = customer["nacionalidad_answer"].replace("%nacionalidad%", customer["nacionalidad"])
	customer["profesion_answer"] = customer["profesion_answer"].replace("%profesion%", customer["profesion"])
	customer["nombre_answer"] = customer["nombre_answer"].replace("%nombre%", customer["name"])
	
	discarded_faces.push_back("%s/m/%s" % [folder, n_img])
	return customer

var current_customer = {}
var killers_indexes = []
func _ready():
	rng.randomize()
	customers_to_kill.push_back(generate_random_customer())
	#customers_to_kill.push_back(generate_random_customer())
	#customers_to_kill.push_back(generate_random_customer())
	customers_to_kill.push_back(generate_random_customer())
	$Book.set_customers_to_kill(customers_to_kill)
	
	for i in range(len(customers_to_kill)):
		killers_indexes.push_back(i)
		
	$EndLabel.text = "Instrucciones:\n"
	$EndLabel.text += "-S para ver libro\n"
	$EndLabel.text += "-C para ver cara\n"
	$EndLabel.text += "-A para preguntar\n"

	$EndLabel.text += "Click en pistola para ajusticiar\n"
	$EndLabel.text += "Arrastrá los items del kiosko a la ventanilla para entregar\n"

	$EndLabel.text += "Podés revisar el libro antes de empezar\n"

	$EndLabel.text += "\n"

	$EndLabel.text += "Espacio para comenzar\n"
	
	#$Silueta2/AnimationPlayer.play("In")


func get_another_customer():
	$decision_timer.paused = false
	$decision_timer.stop()
	$Silueta2.visible = true
	can_play = false
	$Silueta2/AnimationPlayer.play("In")
	game_state = "game_started"
	$EndLabel.visible = false

func _process(delta):
	
	if game_state == "customer_waiting":
		$ProgressTexture.value = current_customer["wait_time"]-$decision_timer.time_left
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if game_state == "game_not_started":
			$Silueta2.visible = true
			can_play = false
			$Silueta2/AnimationPlayer.play("In")
			game_state = "game_started"
			$EndLabel.visible = false
		if game_state == "game_over":
			get_tree().change_scene("res://MainScene.tscn")

	if Input.is_action_just_pressed("escape"):
		$Book.visible = false
		$QuestionRect.visible = false
	
	if can_play:
		if Input.is_action_just_pressed("see_book"):
			$Book.visible = !$Book.visible
			$QuestionRect.visible = false

		#if Input.is_action_just_pressed("ui_accept"):
		#	$Silueta2/AnimationPlayer.play("Out")
		#if Input.is_action_just_pressed("ui_right"):
		#	$Silueta2/AnimationPlayer.play("In")
		#if Input.is_action_just_pressed("ui_left"):
		#	$Silueta2/AnimationPlayer.play("RESET")
	
	
		if Input.is_action_just_pressed("view_face"):
			$CurrentFace.visible = true
			$Book.visible = false
			$QuestionRect.visible = false
		if Input.is_action_just_released("view_face"):
			$CurrentFace.visible = false
			
		if Input.is_action_just_pressed("ask_question"):
			$QuestionRect.visible = !$QuestionRect.visible
			$Book.visible = false

			

func _on_Silueta2_entered():
	print("CUSTOMER ENTERED")
	
	var is_killer = rng.randi_range(1,3)
	
	if is_killer == 1:
		var k_index = killers_indexes.pop_back()
		current_customer = customers_to_kill[k_index]
		customer_is_killer = true
	else:
		current_customer = generate_random_customer()
		customer_is_killer = false
		
	Global.dialogic_replace["hi_text"] = current_customer["dialog"]
	var new_dialog = Dialogic.start('Hi')
	#Dialogic.set_variable()
	add_child(new_dialog)

	new_dialog.connect("timeline_end", self, "after_dialog")

func show_face():
	$CurrentFace.texture = load("res://assets/faces/" + current_customer["face"] + ".png")
	$CurrentFace.visible = true
	$show_face_timer.start()

func after_dialog(timeline_name):
	show_face()
	print("dialog end")

func _on_show_face_timer_timeout():
	$CurrentFace.visible = false
	can_play = true
	
	print("current_customer", current_customer)
	game_state = "customer_waiting"
	$decision_timer.set_wait_time(current_customer["wait_time"])
	$ProgressTexture.max_value = current_customer["wait_time"]
	$decision_timer.start()


func _on_decision_timer_timeout():
	$Silueta2.play_anim("Out")	
	game_state = "customer_leaving"
	cliente_receive_ok = false
	make_goodbye("timeline_name")
	
func _on_Gun2_gun_shooted():
	if !$Book.visible and game_state == "customer_waiting":
		$decision_timer.paused = true
		$Silueta2.play_anim("Kill")
		if customer_is_killer:
			print("Kill correct")
			yield(get_tree().create_timer(3), "timeout")
			$EndLabel.text = "Mataste al correcto\n"
			$EndLabel.text += "Objetivos por eliminar %s\n" % len(killers_indexes)
			$EndLabel.visible = true
			yield(get_tree().create_timer(4), "timeout")
			$Silueta2.play_anim("RESET")	
			$EndLabel.visible = false
			yield(get_tree().create_timer(1), "timeout")
			
			
			if len(killers_indexes) == 0:
				$EndLabel.visible = true
				$EndLabel.text = "Mataste a las raíces del mal. ¡Salvaste al mundo!\n"
				$EndLabel.text += "\n"
				$EndLabel.text += "Espacio para volver a jugar\n"
				game_state = "game_over"	
			else:
				get_another_customer()

		else:
			print("shoot mistake, you lose")
			yield(get_tree().create_timer(3), "timeout")
			$EndLabel.visible = true
			$EndLabel.text = "Mataste al equivocado\n"
			$EndLabel.text += "Game Over\n"
			$EndLabel.text += "\n"
			$EndLabel.text += "Espacio para volver a jugar\n"
			game_state = "game_over"


func get_customer_answer(dialog):
	if dialog in current_customer.keys():
		Global.dialogic_replace["hi_text"] = current_customer[dialog]
		var new_dialog = Dialogic.start('Hi')
		add_child(new_dialog)

func _on_NacButton_pressed():
	$QuestionRect.visible = false
	get_customer_answer("nacionalidad_answer")
	
func _on_NomButton_pressed():
	$QuestionRect.visible = false
	get_customer_answer("nombre_answer")

func _on_ProfButton_pressed():
	$QuestionRect.visible = false
	get_customer_answer("profesion_answer")

func say_goodbye_dialog(dialog):
	Global.dialogic_replace["hi_text"] = dialog
	var new_dialog = Dialogic.start('Hi')
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, "make_goodbye")


var cliente_receive_ok = false
var pedidos_errados = 0
func _on_Silueta2_item_give(item):
	if game_state == "customer_waiting":
		$decision_timer.paused = true
		
		if item == Global.store_item.CERVE && current_customer["want"] == "una cerveza":
			cliente_receive_ok = true
			say_goodbye_dialog("¡Gracias!")
		elif item == Global.store_item.CIGA && current_customer["want"] == "unos cigarrillos":
			cliente_receive_ok = true
			say_goodbye_dialog("Gracias, adios")
		else:
			cliente_receive_ok = false
			say_goodbye_dialog("¡Esto no es lo que pedí, chau!")

func make_goodbye(timeline_name):
	$Silueta2.play_anim("Out")	
	game_state = "customer_leaving"
	
	
	yield(get_tree().create_timer(3), "timeout")

	$EndLabel.visible = true
	$EndLabel.text = ""
	if cliente_receive_ok:
		$EndLabel.text += "Entregaste el pedido correcto\n"
	else:
		$EndLabel.text += "Entregaste el pedido equivocado\n"
		pedidos_errados += 1


	yield(get_tree().create_timer(1), "timeout")
	$EndLabel.text += "%s/3 pedidos incorrectos\n" % pedidos_errados

	$EndLabel.text += "\n"
	yield(get_tree().create_timer(3), "timeout")

	if customer_is_killer:
		$EndLabel.text += "Dejaste ir a uno de los objetivos\n"
		pedidos_errados = 3
		
	if pedidos_errados < 3:
		$Silueta2.play_anim("RESET")	
		$EndLabel.visible = false
		yield(get_tree().create_timer(1), "timeout")
		get_another_customer()
	else:
		$EndLabel.text += "Game over\n"
		$EndLabel.text += "Espacio para volver a jugar\n"
		pedidos_errados = 0
		
		game_state = "game_over"
