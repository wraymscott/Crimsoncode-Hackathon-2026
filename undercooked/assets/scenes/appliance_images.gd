extends Control

@onready var result_thumbnail_texture = $VBoxContainer/result
@onready var img1_thumbnail_texture = $VBoxContainer/result
@onready var img2_thumbnail_texture = $VBoxContainer/result
@onready var img3_thumbnail_texture = $VBoxContainer/result


@export var result_thumbnail : CompressedTexture2D

@export var img1_thumbnail : CompressedTexture2D
@export var img2_thumbnail : CompressedTexture2D
@export var img3_thumbnail : CompressedTexture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	result_thumbnail_texture.texture = result_thumbnail
	img1_thumbnail_texture.texture = img1_thumbnail
	img2_thumbnail_texture.texture = img2_thumbnail
	img3_thumbnail_texture.texture = img3_thumbnail


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
