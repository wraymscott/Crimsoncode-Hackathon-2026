extends Node3D

@onready var countdown_audiostream = $Audiostreams/Countdown
@onready var music_intro_audiostream = $Audiostreams/Music_Intro
@onready var music_audiostream = $Audiostreams/Music

@onready var turn_in_manager = $turn_in_manager

@onready var time_label = $HBoxContainer/VBoxContainer/time

@onready var game_timer = $game_timer

@onready var player1 = $player1
@onready var player2 = $player2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player1.stop_player(3)
	player2.stop_player(3)
	countdown_audiostream.play()
	await get_tree().create_timer(1.125).timeout
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1).timeout
	music_intro_audiostream.play()
	await get_tree().create_timer(1.475).timeout
	music_audiostream.play()
	pass # Replace with function body.

func _process(delta: float) -> void:
	var time_seconds = round(game_timer.time_left)
	time_label.text = "Time: " + str(time_seconds)
	


func _on_game_timer_timeout() -> void:
	if turn_in_manager.player1_money > turn_in_manager.player2_money:
		get_tree().change_scene_to_file("res://assets/scenes/end_scenep1.tscn")
	elif turn_in_manager.player1_money < turn_in_manager.player2_money:
		get_tree().change_scene_to_file("res://assets/scenes/end_scenep2.tscn")
	else:
		get_tree().change_scene_to_file("res://assets/scenes/end_scenetie.tscn")
