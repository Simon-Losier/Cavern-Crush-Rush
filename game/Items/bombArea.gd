extends Area2D

## Variables
var objToRemove = []

@onready var bomb_sound = %BombSound
@onready var sprite = %Sprite2D
@onready var explosion= load("res://Items/Explosion.tscn")

## Functions
func _on_timer_timeout():
	bomb_sound.play()
	var exp = explosion.instantiate()
	get_parent().add_child(exp)
	exp.position = position
	boom()

func boom():
	for obj in objToRemove:
		obj.queue_free()
	sprite.visible = false
	#queue_free()

func _on_area_entered(area):
	objToRemove.append(area)
	
func _on_bomb_sound_finished():
	queue_free()
