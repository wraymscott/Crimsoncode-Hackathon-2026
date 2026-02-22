extends Node3D

@onready var area := $Area3D

@export var contains_item : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Get all bodies currently inside the box
	var bodies = area.get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("player") and Input.get_action_raw_strength("player_interact0"):
			var character = body
			var instanced_item =  contains_item.instantiate()
			character.pick_up_item(instanced_item)
			print("test")
		if body.is_in_group("player") and Input.get_action_raw_strength("player_interact1"):
			var character = body
			var instanced_item =  contains_item.instantiate()
			character.pick_up_item(instanced_item)
