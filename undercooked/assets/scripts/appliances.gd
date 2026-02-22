extends Node3D

@onready var area = $Area3D

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

	if number_of_ingredients == 1:
		ingredient2_fulfilled = true
		ingredient3_fulfilled = true
	if number_of_ingredients == 2:
		ingredient3_fulfilled = true
		
	print(ingredient1_fulfilled)
	print(ingredient2_fulfilled)
	print(ingredient3_fulfilled)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Get all bodies currently inside the box
	
	var bodies = area.get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("player") and Input.get_action_raw_strength("player_interact0"):
			var character = body
			var ing1_name = ingredient1.instantiate().name
			var ing2_name = ingredient2.instantiate().name
			var ing3_name = ingredient3.instantiate().name

			var player_holding = character.get_item_name()
			if player_holding == null:
				break
			
			print(player_holding)
			print(ing1_name)
			
			match player_holding:
				ing1_name:
					character.kill_item()
					if ingredient2_fulfilled and ingredient3_fulfilled:
						character.pick_up_item(resulting_item.instantiate())
					ingredient1_fulfilled = true
				ing2_name:
					character.kill_item()
					if ingredient1_fulfilled and ingredient3_fulfilled:
						character.pick_up_item(resulting_item.instantiate())
					ingredient2_fulfilled = true
				ing3_name:
					character.kill_item()
					if ingredient1_fulfilled and ingredient2_fulfilled:
						character.pick_up_item(resulting_item.instantiate())
					ingredient1_fulfilled = true
