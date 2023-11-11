extends Control

@onready var player_inventory : PlayerInventory = $Inventory
var item_data_ui_scene : PackedScene = preload("res://Inventory/ItemDataUI.tscn")

func _ready():
	create_inventory()
		
func create_inventory():
	for inventory_item in player_inventory.inventory:
		var instance_item = item_data_ui_scene
		instance_item.set_ui_item_data(inventory_item)
		add_child(instance_item)
	

