extends Node3D

@onready var order_timer = $order_timer
@onready var order_container = $gui/VBoxContainer/order_container

@onready var turn_in_manager = $"../turn_in_manager"


@export var order_scene: PackedScene 

@export var burger : PackedScene

@export var burger_ingredients1 : PackedScene
@export var burger_ingredients2 : PackedScene
@export var burger_ingredients3 : PackedScene

@export var burger_thumbnail : Texture2D
@export var burger_ingredient1_thumbnail : Texture2D
@export var burger_ingredient2_thumbnail : Texture2D
@export var burger_ingredient3_thumbnail : Texture2D


@export var veggie_stew : PackedScene

@export var veggie_stew1 : PackedScene
@export var veggie_stew2 : PackedScene

@export var veggie_stew_thumbnail : Texture2D
@export var veggie_stew_ingredient1_thumbnail : Texture2D
@export var veggie_stew_ingredient2_thumbnail : Texture2D

var orders = []

func _ready():
	order_timer.timeout.connect(_on_order_timeout)
	order_timer.start(3)
	
func _on_order_timeout():
	random_order()
	order_timer.start(30)

func random_order():
	var instanced_order_scene =  order_scene.instantiate()
	var randnum = randi_range(0, 1)
	order_container.add_child(instanced_order_scene)
	var new_order = order_container.get_child(-1)
	if randnum == 1:
		orders.append("burger")
		new_order.create_order_3_ingredient(burger_thumbnail, burger_ingredient1_thumbnail, burger_ingredient2_thumbnail, burger_ingredient3_thumbnail)
	else:
		orders.append("stew")
		new_order.create_order_2_ingredient(veggie_stew_thumbnail, veggie_stew_ingredient1_thumbnail, veggie_stew_ingredient2_thumbnail)
	
	turn_in_manager.update_orders(orders)
	
func update_orders(remove_item):
	# .erase() finds the first match and removes it safely
	orders.erase(remove_item)
	for child in order_container.get_children():
		print(child.order_name)
		if child.order_name == remove_item:
			child.queue_free()
			break
	turn_in_manager.update_orders(orders)
