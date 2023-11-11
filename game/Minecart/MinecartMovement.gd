extends RigidBody2D

## Variables
# Should the minecart follow a horizontal plane, or vertical plane?
@export var vertical : bool = false

## Functions
func _integrate_forces(state):
	var vel = state.get_linear_velocity()
	if(!vertical):
		state.set_linear_velocity(Vector2(vel.x, 0))
