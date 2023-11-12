extends RigidBody2D

## Variables
var vel : Vector2

@onready var sounds = %Sounds

## Functions
func _integrate_forces(state) -> void:
	vel = state.get_linear_velocity()
	vel.y = 0
	state.set_linear_velocity(vel)
	if(vel != Vector2.ZERO):
		sounds.play()
	else:
		sounds.stop()
