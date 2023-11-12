extends Resource
class_name DoorData

## Signals
signal door_opened

## Variables
var doors_enabled : int = 0:
	set(i):
		doors_enabled = i
		if(doors_enabled >= 2):
			emit_signal("door_opened")
