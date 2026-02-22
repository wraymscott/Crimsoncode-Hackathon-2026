extends Node3D

@onready var order_timer = $order_timer
@onready var order_container = $gui/VBoxContainer/HBoxContainer

@export var order_scene: PackedScene 


func _ready():
	order_timer.timeout.connect(_on_order_timeout)
	order_timer.start()
	
func _on_order_timeout():
	
	var instanced_order_scene =  order_scene.instantiate()
	order_container.add_child(instanced_order_scene)
