extends Control

@onready var patience_timer = $patience_timer

@onready var name_label = $bg/VBoxContainer/name
@onready var ingredients_label = $bg/VBoxContainer/ingredients

@export var min_time = 60
@export var max_time = 90

var order_name = ""
var order_ingredients = []

func _ready() -> void:
	random_order()
	update_order_visual(order_name, order_ingredients)
	
	var duration = randi_range(min_time, max_time)
	
	patience_timer.timeout.connect(_on_patience_timeout)
	
	patience_timer.start(duration)

func _on_patience_timeout():
	queue_free()

func random_order():
	var names = ["veggie burger", "burger", "vegetable soup"]
	var ingredients = [["buns", "lettuce", "patty"], ["buns", "patty"], ["carrots", "lettuce"]]
	
	var index = randi_range(0, names.size() - 1)
	
	
	order_name = names[index]
	order_ingredients = ingredients[index]
	print(order_ingredients)
	
func update_order_visual(new_name, ingredients):
	name_label.text = new_name
	var ingredients_string = ""
	for ingredient in ingredients:
		ingredients_string += ingredient + ", "
	ingredients_label.text = ingredients_string
	
