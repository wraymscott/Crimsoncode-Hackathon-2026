extends Control

@onready var round_timer = $round_timer
@onready var round_label = $HBoxContainer/round_label

@onready var order1 = {"Name":"None"}
@onready var order2 = "Order 2"
@onready var order3 = "Order 3"
@onready var order4 = "Order 4"
@onready var order5 = "Order 5"

@onready var Order1Label = $Order1Rect/Order1/Order1Label
@onready var Order2Label = $Order2Rect/Order2/Order2Label
@onready var Order3Label = $Order3Rect/Order3/Order3Label
@onready var Order4Label = $Order4Rect/Order4/Order4Label
@onready var Order5Label = $Order5Rect/Order5/Order5Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	round_label.set_text(str(int(round_timer.get_time_left())))
	Order1Label.set_text(order1["Name"])
	Order2Label.set_text(order2)
	Order3Label.set_text(order3)
	Order4Label.set_text(order4)
	Order5Label.set_text(order5)
	pass
