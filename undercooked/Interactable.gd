class_name Interactable extends Area3D

@export_enum("Cook Soup", "Poison Soup") var action: String
@onready var area := $Area3D


#signal prompt_action(action: String)
#signal action_recieved(action: String)



#func detect_entity():
	#while monitoring:
		#await body_shape_entered
		#prompt_action.emit(instantiate_prompt())	
		#while !(body_shape_exited):
			#await action_recieved
		#
		#
#
#func instantiate_prompt():
	#var prompt = Button.new()
	#prompt.text = action
	#prompt.pressed.connect(action_recieved)
	#add_child(prompt)
	#




func await_entity():
	var prompt = Button.new()
	prompt.text = action
	prompt.visible = false
	while monitoring:
		
		while body_shape_entered :
			#print("body entered")
			prompt.visible = true
		print("body exited")
		prompt.visible = false
		monitoring = false

#
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	await_entity()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
