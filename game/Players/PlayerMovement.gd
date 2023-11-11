extends CharacterBody2D

## Constants
const MOVEMENT_SPEED = 200.0
const SLOWDOWN = 10.0

## Variables
@export var is_player_1 : bool = true

var movement : Vector2 = Vector2(0,0)

## Functions
func _physics_process(delta) -> void:
	if(is_player_1):
		movement = Input.get_vector("player_1_move_left", "player_1_move_right", "player_1_move_up", "player_1_move_down")
	else:
		movement = Input.get_vector("player_2_move_left", "player_2_move_right", "player_2_move_up", "player_2_move_down")
	# Set the movementocity, and move the player
	movement = movement * MOVEMENT_SPEED
	velocity = velocity.lerp(movement, delta * SLOWDOWN)
	move_and_slide()
