extends Area2D

## Variables
var objToRemove = []

@onready var bomb_sound = %BombSound

## Functions
func _on_timer_timeout():
	bomb_sound.play()
	boom()

func boom():
	for obj in objToRemove:
		obj.queue_free()
	queue_free()

func _on_area_entered(area):
	objToRemove.append(area)
