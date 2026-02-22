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

@onready var CountdownLabel = $Countdown

var roundEnd = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	CountdownLabel.set_text("3")
	await get_tree().create_timer(1.0).timeout
	CountdownLabel.set_text("2")
	await get_tree().create_timer(1.0).timeout
	CountdownLabel.set_text("1")
	await get_tree().create_timer(1.0).timeout
	CountdownLabel.set_text("GO!")
	await get_tree().create_timer(1.0).timeout
	CountdownLabel.set_text("")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if round_timer.get_time_left() < 300:
		round_label.set_text(str(int(round_timer.get_time_left())))
		
	if round_timer.get_time_left() < 11 && round_timer.get_time_left() > 0:
		if fmod(round_timer.get_time_left(), 1.00) < 0.015:
			$Clock_Tick.play()
			
	if round_timer.is_stopped() && roundEnd == 0:
		roundEnd = 1
		$End_Bell.play()
		
	Order1Label.set_text(order1["Name"])
	Order2Label.set_text(order2)
	Order3Label.set_text(order3)
	Order4Label.set_text(order4)
	Order5Label.set_text(order5)
	pass
