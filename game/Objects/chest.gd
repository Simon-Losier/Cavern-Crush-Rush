extends Area2D

## Variables
@export var item: ItemData
@export var player_inventory: PlayerInventory

@onready var sounds = %Sounds

var open: bool = false

## Functions
func _physics_process(delta):
	if $AnimatedSprite2D.frame == 1:
		$AnimatedSprite2D.pause()

func _on_body_entered(body):
	if (!open):
		$AnimatedSprite2D.play("open")
		player_inventory.add_item(item)
		open = true
		sounds.play()
