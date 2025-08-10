extends Node

@export var player : CharacterBody3D
@export var mesh_root : Node3D
@export var rotation_speed : float = 8
@export var fall_gravity = 45

var direction : Vector3
var velocity : Vector3
var acceleration : float
var speed : float
var cam_rotation : float = 0
var jump_gravity : float
var tempx : float = 0.0
var tempz : float = 0.0
var on_ground = false

func _physics_process(delta):
	velocity.x = speed * direction.normalized().x
	velocity.z = speed * direction.normalized().z
	velocity.y += -get_gravity() * delta
	
	
	if player.is_on_floor():
		on_ground = true
	else:
		if on_ground:
			on_ground = false
			tempx = velocity.x
			tempz = velocity.z
	
	player.velocity = player.velocity.lerp(velocity, acceleration * delta)
	#player.velocity.x = velocity.x
	#player.velocity.z = velocity.z
	#player.velocity.y = velocity.y
	
	
	if not on_ground:
		player.velocity.x = tempx
		player.velocity.z = tempz
		
	player.move_and_slide()
	
	var target_rotation = atan2(direction.x, direction.z) - player.rotation.y
	mesh_root.rotation.y = lerp_angle(mesh_root.rotation.y, target_rotation, rotation_speed * delta)

func _jump(jump_state : JumpState):
	velocity.y = 2 * jump_state.jump_height / jump_state.apex_duration
	jump_gravity = (2 * jump_state.jump_height) / (jump_state.apex_duration * jump_state.apex_duration)


func get_gravity() -> float:
	return jump_gravity if velocity.y > 0.0 else fall_gravity

func _on_set_movement_state(_movement_state : MovementState):
	speed = _movement_state.movement_speed
	acceleration = _movement_state.acceleration
	

func _on_set_movement_direction(_movement_direction : Vector3):
	direction = _movement_direction.rotated(Vector3.UP, cam_rotation)

func _on_set_cam_rotation(_cam_rotation : float):
	cam_rotation = _cam_rotation
