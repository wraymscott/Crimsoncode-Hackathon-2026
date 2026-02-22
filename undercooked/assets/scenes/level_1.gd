extends Node3D

@onready var countdown_audiostream = $Audiostreams/Countdown
@onready var music_intro_audiostream = $Audiostreams/Music_Intro
@onready var music_audiostream = $Audiostreams/Music

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countdown_audiostream.play()
	await get_tree().create_timer(1.125).timeout
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1).timeout
	music_intro_audiostream.play()
	await get_tree().create_timer(1.475).timeout
	music_audiostream.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
