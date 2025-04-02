extends Node

@export var animation_tree: AnimationTree
@onready var player: Player = get_owner()

## Direction player is facing the last time a movement was detected.[br]
## Starts facing the camera.
var last_facing_direction := Vector2(0, 1)

func _physics_process(_delta: float) -> void:
	# Are we not moving?
	var idle = !player.velocity
	
	# Track last direction player moved
	if !idle:
		last_facing_direction = player.velocity.normalized()
	
	# Update position (velocity) interpolation of animation blend.
	# Automatically handles changing animation direction per animation
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
	animation_tree.set("parameters/Walk/blend_position", last_facing_direction)
