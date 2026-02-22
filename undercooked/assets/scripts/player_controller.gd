extends CharacterBody3D
#alskdcnasc
@onready var anim_player = $Barbarian/AnimationPlayer
@onready var animation_tree = $Barbarian/AnimationTree
@onready var state_machine = animation_tree["parameters/playback"]
@onready var pickup_reach := $pickup_reach

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
	
	#if Input.is_action_just_pressed("player_drop_item0"):
		#drop_item()



func detect_floor_item():
	var bodies = pickup_reach.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("items") and not is_holding:
			pick_up_item(body)
			body.queue_free()
			is_holding

func pick_up_item(item_node):
	
	if not is_holding:
		# Optional: freeze any physics (like RigidBody3D) on the item before parenting
		if item_node is RigidBody3D:
			item_node.freeze = true 

		if item_node.has_node("CollisionShape3D"):
			item_node.get_node("CollisionShape3D").disabled = true
		
		# Reparent the item to the BoneAttachment3D node
		var hand_attachment_node = get_node("Barbarian/Rig_Medium/Skeleton3D/BoneAttachment3D")
		hand_attachment_node.add_child(item_node)

		# Adjust position if needed, or if an offset is stored
		item_node.global_transform.origin = hand_attachment_node.global_transform.origin
		# ... other transform adjustments
		
		$Pickup_Ingredient.play()
		
		is_holding = true
		
func get_item():
	var hand_attachment_node = get_node("Barbarian/Rig_Medium/Skeleton3D/BoneAttachment3D")
	return hand_attachment_node.get_child(0)
	
		
func drop_item():
	if is_holding:
		var hand_attachment_node = get_node("Barbarian/Rig_Medium/Skeleton3D/BoneAttachment3D")
		var item = hand_attachment_node.get_child(0)

		# 1. Store the player's position and direction
		var drop_pos = global_position + (-global_transform.basis.z * 1.5) # 1.5 units in front

		# 2. Re-parent
		hand_attachment_node.remove_child(item)
		get_parent().add_child(item)

		# 3. Teleport the item to the drop position
		item.global_position = drop_pos
		is_holding = false
