class_name Enemy
extends CharacterBody2D

@export var stats: EnemyStats

#@onready var target: Node2D = %Player
var target: Node2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	
	pass # Replace with function body.

func initialize(spawn_position: Vector2, target_node: Node2D) -> void:
	global_position = spawn_position
	target = target_node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
	velocity = position.direction_to(target.position) * stats.max_speed
	
	#position.move_toward(target.position, stats.max_speed * delta)
	
	#velocity.x = move_toward(global_position.x, target.global_position.x, stats.max_speed * delta)
	#velocity.y = move_toward(global_position.y, target.global_position.y, stats.max_speed * delta)

	#global_position = global_position.move_toward(player_position, SPEED * delta)
	
	#print(velocity)

	move_and_slide()
