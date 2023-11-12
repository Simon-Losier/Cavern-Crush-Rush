extends Area2D

@export var item: ItemData
@export var player_inventory: PlayerInventory
var open: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite2D.frame == 1:
		$AnimatedSprite2D.pause()



func _on_body_entered(body):
	if (!open):
		$AnimatedSprite2D.play("open")
		player_inventory.add_item(item)
		open = true
