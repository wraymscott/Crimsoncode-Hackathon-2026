#extends Interactable
#
##
##func await_entity():
	##var prompt = Button.new()
	##prompt.text = action
	##prompt.visible = false
	##while monitoring:
		##await body_shape_entered
		##while !(body_shape_exited | prompt.pressed):
			##prompt.visible = true
		##prompt.visible = false
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#monitoring = true
	#await_entity()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
