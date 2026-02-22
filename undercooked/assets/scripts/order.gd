extends Control

@onready var patience_timer = $patience_timer

@onready var result = $result
@onready var ingredient1 = $result/VBoxContainer/HBoxContainer/img1
@onready var ingredient2 = $result/VBoxContainer/HBoxContainer/img2
@onready var ingredient3 = $result/VBoxContainer/HBoxContainer/img3

@onready var audio_maker = $AudioStreamPlayer

@export var min_time = 60
@export var max_time = 90

var order_name = ""
var order_ingredients = []

func _ready() -> void:
	var duration = randi_range(min_time, max_time)
	
	patience_timer.timeout.connect(_on_patience_timeout)
	
	patience_timer.start(duration)

func _on_patience_timeout():
	queue_free()

func create_order_2_ingredient(result_thumbnail : Texture2D, ingredient1_thumbnail : Texture2D, ingredient2_thumbnail : Texture2D):
	order_name = "stew"
	result.texture = result_thumbnail
	ingredient1.texture = ingredient1_thumbnail
	ingredient2.texture = ingredient2_thumbnail
	ingredient3.queue_free()


func create_order_3_ingredient(result_thumbnail : Texture2D, ingredient1_thumbnail : Texture2D, ingredient2_thumbnail : Texture2D, ingredient3_thumbnail : Texture2D):
	order_name = "burger"
	result.texture = result_thumbnail
	ingredient1.texture = ingredient1_thumbnail
	ingredient2.texture = ingredient2_thumbnail
	ingredient3.texture = ingredient3_thumbnail
