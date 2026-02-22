extends CharacterBody3D

@onready var anim_player = $Barbarian/AnimationPlayer
@onready var animation_tree = $Barbarian/AnimationTree
@onready var state_machine = animation_tree["parameters/playback"]

@onready var footsteps = $Footsteps

@export var player_id = 0;

const SPEED = 7.0
const JUMP_VELOCITY = 4.5

var is_holding = false
var item

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
		
		if !footsteps.playing:
			footsteps.play()
		
		# Smoothly rotate toward that angle (0.15 is the weight/speed of turn)
		rotation.y = lerp_angle(rotation.y, target_angle, 0.15)
		state_machine.travel("running")
	else:
		state_machine.travel("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		footsteps.stop()

	move_and_slide()

func pick_up_item(item_node):
	# Optional: freeze any physics (like RigidBody3D) on the item before parenting
	if item_node is RigidBody3D:
		item_node.freeze = true 

	# Reparent the item to the BoneAttachment3D node
	var hand_attachment_node = get_node("Barbarian/Rig_Medium/Skeleton3D/BoneAttachment3D")
	hand_attachment_node.add_child(item_node)

	# Adjust position if needed, or if an offset is stored
	item_node.global_transform.origin = hand_attachment_node.global_transform.origin
	# ... other transform adjustments

	
func drop_item():
	pass
