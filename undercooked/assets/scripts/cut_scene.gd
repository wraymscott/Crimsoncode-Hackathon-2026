extends Node3D

@onready var anim_player = $AnimationPlayer
@onready var timer = $scene_switch

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("Chapter_1")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_scene_switch_timeout() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/level1.tscn")
