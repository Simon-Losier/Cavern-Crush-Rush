extends Marker2D

## Variables
@export var player_inventory : PlayerInventory
@export var is_player_1 : bool = true

@onready var bomb_item : ItemData = preload("res://Inventory/BombData.tres")
@onready var bomb_scene : PackedScene = preload("res://Items/bomb.tscn")
@onready var bomb_sound = %BombFuse

## Functions
func _physics_process(delta):
	if((Input.is_action_just_pressed("player_1_action") && is_player_1) or (Input.is_action_just_pressed("player_2_action") && is_player_1 == false)):
		print("place")
		if(player_inventory.inventory.size() != 0):
			_place_bomb()
			
func _place_bomb():
	if(player_inventory.inventory[0].item_data == bomb_item):
		player_inventory.remove_item(bomb_item)
		var new_bomb = bomb_scene.instantiate()
		new_bomb.set_transform(get_global_transform())
		get_tree().get_root().add_child(new_bomb)
		bomb_sound.play()
