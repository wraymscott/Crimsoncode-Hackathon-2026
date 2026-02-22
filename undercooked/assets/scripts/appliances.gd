extends Node3D

@onready var area = $Area3D
@onready var cook_timer = $cook_timer
@onready var progress_bar = $SubViewport/progress_bar

@export var cook_time_seconds = 10

@export var number_of_ingredients = 3
@export var ingredient1 : PackedScene
@export var ingredient2 : PackedScene
@export var ingredient3 : PackedScene

@export var resulting_item : PackedScene

var ingredient1_fulfilled = false
var ingredient2_fulfilled = false
var ingredient3_fulfilled = false

var is_cooking = false
var food_cooked = false

var character_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	if number_of_ingredients == 1:
		ingredient2_fulfilled = true
		ingredient3_fulfilled = true
	if number_of_ingredients == 2:
		ingredient3_fulfilled = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if is_cooking:
		progress_bar.visible = true
		progress_bar.get_child(0).value = 100 -((cook_timer.time_left / cook_time_seconds) * 100)
		#progress_bar.get_child(0).value = (cook_time_seconds - cook_timer.time_left) / 
	else:
		progress_bar.visible = false
		gather_ingredients()

	if food_cooked:
		give_player_cooked_item()

func give_player_cooked_item():

	var bodies = area.get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("player") and (Input.get_action_raw_strength("player_interact0") or Input.get_action_raw_strength("player_interact1")):
			print("uidsolkmg")
			if body.is_holding == false:
				body.pick_up_item(resulting_item.instantiate())
				is_cooking = false
				food_cooked = false
				ingredient1_fulfilled = false
				ingredient2_fulfilled = false
				ingredient3_fulfilled = false

func gather_ingredients():
	
	var bodies = area.get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("player") and (Input.get_action_raw_strength("player_interact0") or Input.get_action_raw_strength("player_interact1")):
			var character = body
			var ing1_name = ingredient1.instantiate().name
			var ing2_name = ingredient2.instantiate().name
			var ing3_name = ingredient3.instantiate().name

			var player_holding = character.get_item_name()
			if player_holding == null:
				break
			
			
			match player_holding:
				ing1_name:
					character.kill_item()
					if ingredient2_fulfilled and ingredient3_fulfilled:
						food_start_cook()
						character_node = body
					ingredient1_fulfilled = true
				ing2_name:
					character.kill_item()
					if ingredient1_fulfilled and ingredient3_fulfilled:
						food_start_cook()
						character_node = body
					ingredient2_fulfilled = true
				ing3_name:
					character.kill_item()
					if ingredient1_fulfilled and ingredient2_fulfilled:
						food_start_cook()
						character_node = body
					ingredient1_fulfilled = true

func food_start_cook():
	is_cooking = true
	cook_timer.start(cook_time_seconds)


func _on_cook_timer_timeout() -> void:
	food_cooked = true
