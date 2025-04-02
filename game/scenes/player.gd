extends CharacterBody2D


@export var speed: float


func _physics_process(delta: float) -> void:
	get_movement()
	move_and_slide()


## Set velocity based on input actions.[br]
## [br]
## Applies [constant SPEED].
func get_movement():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
