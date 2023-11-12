extends Area2D

var activated = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("player_1_action"):
		if (activated):
			deactivate()
		else:
			activate()

func activate():
	activated = true
	var elements = [$Door2, $LH, $LF, $RH, $RF]
	for element in elements:
		element.play("open")

func deactivate():
	activated = false
	var elements = [$Door2, $LH, $LF, $RH, $RF]
	for element in elements:
		element.play("closed")
