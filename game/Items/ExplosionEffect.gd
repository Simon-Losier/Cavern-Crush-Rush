extends Sprite2D

@export var shad_material: ShaderMaterial
@export var speed = 0.1
var t = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	t = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if t < 1:
		t+= speed
		shad_material.set_shader_parameter("t",t)
	else:
		queue_free()
	
