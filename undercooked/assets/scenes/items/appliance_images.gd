extends Control

# 1. Point these to the CORRECT unique nodes in your scene tree
@onready var result_node = $result
@onready var img1_node   = $result/VBoxContainer/HBoxContainer/img1
@onready var img2_node   = $result/VBoxContainer/HBoxContainer/img2
@onready var img3_node   = $result/VBoxContainer/HBoxContainer/img3

# 2. Use Texture2D for better flexibility
@export var result_thumbnail : Texture2D
@export var img1_thumbnail   : Texture2D
@export var img2_thumbnail   : Texture2D
@export var img3_thumbnail   : Texture2D

func _ready() -> void:
	# 3. Assign the exported textures to the node's 'texture' property
	if result_thumbnail: 
		result_node.texture = result_thumbnail
	else:
		result_node.queue_free()
	if img1_thumbnail:   
		img1_node.texture = img1_thumbnail
	else:
		img1_node.queue_free()
	if img2_thumbnail:   
		img2_node.texture = img2_thumbnail
	else:
		img2_node.queue_free()
	if img3_thumbnail:   
		img3_node.texture = img3_thumbnail
	else:
		img3_node.queue_free()
