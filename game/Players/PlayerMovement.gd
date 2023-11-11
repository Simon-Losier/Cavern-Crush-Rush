extends CharacterBody2D

## Constants
const MOVEMENT_SPEED = 2.0
const SLOWDOWN = 10.0

## Variables
@export var is_player_1 : bool = true

var vel : Vector2 = Vector2(0,0)

## Functions
# Get the movement input vectors
func _unhandled_input(event) -> void:
	if(is_player_1):
		vel.x = Input.get_axis("player_1_move_left", "player_1_move_right")
		vel.y = Input.get_axis("player_1_move_up", "player_1_move_down")
	else:
		vel.x = Input.get_axis("player_2_move_left", "player_2_move_right")
		vel.y = Input.get_axis("player_2_move_up", "player_2_move_down")

func _physics_process(delta) -> void:
	# Set the velocity, and move the player
	velocity = velocity.lerp(vel, delta * SLOWDOWN)
	move_and_slide()
