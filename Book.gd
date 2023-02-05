extends Node2D

var customers_to_kill = []
var current_customer_pair = 0

func _ready():
	pass

func load_left(customer):
	$LeftName.text = customer["name"]
	$LeftAvatar.texture = load("res://assets/faces/" + customer["face"] + ".png")

	$LeftData.text = "Profesión:%s\nNacionalidad:%s" % [customer["profesion"], customer["nacionalidad"]]

	$LeftInfo.text = customer["info"] 
	
func load_right(customer):
	$RightName.text = customer["name"]
	$RightAvatar.texture = load("res://assets/faces/" + customer["face"] + ".png")
	
	$RightData.text = "Profesión:%s\nNacionalidad:%s" % [customer["profesion"], customer["nacionalidad"]]
	$RightInfo.text = customer["info"] 
	
func set_customers_to_kill(ctk):
	customers_to_kill = ctk
	
	load_left(customers_to_kill[0])
	load_right(customers_to_kill[1])

func _on_Siguiente_pressed():
	current_customer_pair += 2
	print(current_customer_pair, " - ", len(customers_to_kill))
	if current_customer_pair > len(customers_to_kill)-1:
		current_customer_pair = 0
	load_left(customers_to_kill[current_customer_pair])
	load_right(customers_to_kill[current_customer_pair+1])

func _on_Anterior_pressed():
	current_customer_pair -= 2
	if current_customer_pair < 0:
		current_customer_pair = len(customers_to_kill)-2
	load_left(customers_to_kill[current_customer_pair])
	load_right(customers_to_kill[current_customer_pair+1])
