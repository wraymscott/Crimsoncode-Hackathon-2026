extends Control

# 1. Point these to the CORRECT unique nodes in your scene tree
@onready var result_node = $VBoxContainer/result
@onready var img1_node   = $VBoxContainer/HBoxContainer/img1
@onready var img2_node   = $VBoxContainer/HBoxContainer/img2
@onready var img3_node   = $VBoxContainer/HBoxContainer/img3

# 2. Use Texture2D for better flexibility
@export var result_thumbnail : Texture2D
@export var img1_thumbnail   : Texture2D
@export var img2_thumbnail   : Texture2D
@export var img3_thumbnail   : Texture2D

func _ready() -> void:
	# 3. Assign the exported textures to the node's 'texture' property
	if result_thumbnail: result_node.texture = result_thumbnail
	if img1_thumbnail:   img1_node.texture = img1_thumbnail
	if img2_thumbnail:   img2_node.texture = img2_thumbnail
	if img3_thumbnail:   img3_node.texture = img3_thumbnail
