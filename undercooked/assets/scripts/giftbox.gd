extends Node3D

@onready var gift_timer = $gift_spawn_timer
@onready var area = $Area3D
@onready var audio = $AudioStreamPlayer3D

var power_ups = ["shield"]

var powerup_spawned = false
var powerup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gift_timer.start(randi_range(10, 20))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bodies = area.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("player"):
			if powerup == "shield":
				audio.play()
				body.is_shielded = true
				powerup = "nothing"



func _on_gift_spawn_timer_timeout() -> void:
	if not powerup_spawned:
		var randomnum = randi_range(0,power_ups.size()-1)
		powerup = power_ups[randomnum]
	else:
		audio.play()
		
	gift_timer.start(randi_range(10, 20))
