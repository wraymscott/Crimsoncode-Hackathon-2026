extends Control

@onready var round_timer = $round_timer
@onready var round_label = $HBoxContainer/round_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	round_label.set_text(str(int(round_timer.get_time_left())))
	pass
