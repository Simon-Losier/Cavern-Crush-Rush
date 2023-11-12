extends Area2D

var objToRemove = []

func _on_timer_timeout():
	boom()

func boom():
	for obj in objToRemove:
		obj.queue_free()
	queue_free()

func _on_area_entered(area):
	objToRemove.append(area)
