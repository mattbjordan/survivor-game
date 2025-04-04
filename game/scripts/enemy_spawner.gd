class_name EnemySpawner
extends Node

@export var spawn_delay_seconds: float = 1.0
@export var min_spawn_time: float = 1.0
@export var max_spawn_time: float = 5.0

#@export var player: Node2D
@onready var player: Node2D = %Player
@export var spawn_away_from_radius: float = 100.0
@export var spawn_radius: float = 50.0

#@export var enemy_list: EnemyWithWeight
@export var enemy_weights: Dictionary[String, float] = {
	"bat": 1
}

@onready var spawned_enemies = $SpawnedEnemies
@onready var timer: Timer = $Timer

const ENEMY = preload("res://scenes/bat.tscn")

func _ready() -> void:
	$Timer.start(spawn_delay_seconds) # buffer time before spawning enemies
	
func _on_timer_timeout() -> void:
	print("Spawning new enemy")
	spawn_enemy()
	
	# Spawn new enemy every 1 - 5 seconds
	timer.start(randi_range(min_spawn_time, max_spawn_time))

func spawn_enemy() -> void:
	var enemy = ENEMY.instantiate()
	
	var player_position = player.global_position
	
	var spawn_range_vector = (Vector2.RIGHT * randf_range(spawn_away_from_radius, spawn_radius))
	var spawn_location_vector = spawn_range_vector.rotated(randf_range(0, PI))
	
	var spawn_location = player_position + spawn_location_vector
	
	#var rand_x = randf_range(-5, 5)
	#var rand_y = randf_range(-5, 5)
	#var enemy_position = player_position + Vector2(rand_x + spawn_away_from_radius, rand_y + spawn_away_from_radius)
		
	enemy.initialize(spawn_location, player)	
	#enemy.global_position = enemy_position
	
	print("Spawning enemy at " + str(spawn_location))
	
	spawned_enemies.add_child(enemy)
