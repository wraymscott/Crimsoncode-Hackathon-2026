extends CharacterBody3D

@onready var anim_player = $Barbarian/AnimationPlayer
@onready var animation_tree = $Barbarian/AnimationTree
@onready var state_machine = animation_tree["parameters/playback"]

@export var player_id = 0;

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

#hello
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
#
	var input_dir := Vector2.ZERO
	
	if player_id == 0:
		input_dir = Input.get_vector("player_left0", "player_right0", "player_up0", "player_down0")
	elif player_id == 1:
		input_dir = Input.get_vector("player_left1", "player_right1", "player_up1", "player_down1")

		
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
	
