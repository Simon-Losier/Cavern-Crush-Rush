extends RigidBody2D

## Variables
var vel : Vector2

## Functions
func _integrate_forces(state) -> void:
	vel = state.get_linear_velocity()
	vel.y = 0
	state.set_linear_velocity(vel)
