extends Node3D

@onready var area = $Area3D
@onready var order_manager = $"../order_manager"

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
				order_manager.update_orders(player_item)

func validate_order(attempted_item):
	for order in current_orders:
		if attempted_item == order:
			return true
		else:
			return false
			
func update_orders(orders):
	current_orders = orders
	print(current_orders)
