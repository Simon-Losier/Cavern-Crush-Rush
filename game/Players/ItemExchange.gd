extends Node

## Variables
@export var player_inventory : PlayerInventory
@export var is_player_1 : bool = true

## Functions
func _physics_process(delta) -> void:
	# Which player is calling this? If so, check if they are trying to interact with a crafting station or minecart
	if(is_player_1 && Input.is_action_just_pressed("player_1_insert")):
		player_inventory.emit_signal("exchanging_item", true)
	elif(!is_player_1 && Input.is_action_just_pressed("player_2_insert")):
		player_inventory.emit_signal("exchanging_item", false)
