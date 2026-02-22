extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Countdown.play()
	await get_tree().create_timer(1.125).timeout
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1).timeout
	$Music_Intro.play()
	await get_tree().create_timer(1.475).timeout
	$Music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
