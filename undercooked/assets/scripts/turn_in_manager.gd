extends Node3D

@onready var area = $Area3D
@onready var order_manager = $"../order_manager"

@onready var player1_label = $"../HBoxContainer/VBoxContainer/player1_score"
@onready var player2_label = $"../HBoxContainer/VBoxContainer/player2_score"

@onready var audio = $AudioStreamPlayer3D

var player1_money = 0
var player2_money = 0

var current_orders = ["empty"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bodies = area.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("player"):
			var player_item = body.get_item_name()
			if validate_order(player_item):
				body.kill_item()
				if body.player_id == 0:
					player1_money += 1000
					player1_label.text = "Player 1: " + str(player1_money)
				else:
					player2_money += 1000
					player2_label.text = "Player 2: " + str(player2_money)

				order_manager.update_orders(player_item)

func validate_order(attempted_item):
	for order in current_orders:
		if attempted_item == order:
			audio.play()
			return true
		else:
			return false
			
func update_orders(orders):
	current_orders = orders

func update_labels():
	player1_label.text = "Player 1: " + str(player1_money)
	player2_label.text = "Player 2: " + str(player2_money)
