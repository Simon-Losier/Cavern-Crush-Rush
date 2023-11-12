extends RayCast2D

## Variables

## Functions
func _physics_process(delta):
	if(is_colliding()):
		var collision = get_collider()
		collision.apply_central_force(target_position)
