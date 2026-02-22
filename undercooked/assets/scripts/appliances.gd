extends Node3D

@export var number_of_ingredients = 3
@export var ingredient1 : PackedScene
@export var ingredient2 : PackedScene
@export var ingredient3 : PackedScene

@export var resulting_item : PackedScene

var ingredient1_fulfilled = false
var ingredient2_fulfilled = false
var ingredient3_fulfilled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func use_ingredient(ingredient):
	pass
