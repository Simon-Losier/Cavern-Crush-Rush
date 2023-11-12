extends Control

@export var player_inventory : PlayerInventory
var item_data_ui_scene : PackedScene = preload("res://Inventory/ItemDataUI.tscn")
@onready var h_box : HBoxContainer = $HBoxContainer

func _ready():
	create_inventory()
	player_inventory.inventory_updated.connect(create_inventory)
		
func create_inventory():
	var childs = h_box.get_child_count()
	for child in childs:
		h_box.get_child(child).queue_free()
		
	for inventory_item_dict in player_inventory.inventory:
		var item_instance = item_data_ui_scene.instantiate()
		h_box.add_child(item_instance)
		item_instance.set_ui_item_data(inventory_item_dict)
	

