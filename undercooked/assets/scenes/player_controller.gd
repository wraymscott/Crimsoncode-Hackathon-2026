extends CharacterBody3D

@onready var animation_tree = $Barbarian/AnimationTree
@onready var state_machine = animation_tree["parameters/playback"]

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	var direction := Vector3(input_dir.x, 0, input_dir.y).normalized()
	

	if direction:
		var target_angle = atan2(direction.x, direction.z)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		# Smoothly rotate toward that angle (0.15 is the weight/speed of turn)
		rotation.y = lerp_angle(rotation.y, target_angle, 0.15)
		state_machine.travel("running")
	else:
		state_machine.travel("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
