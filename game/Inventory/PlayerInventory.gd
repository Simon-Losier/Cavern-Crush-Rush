class_name PlayerInventory extends Node2D

@export var inventory : Array[Dictionary]

func add_item(item : ItemData):
	var item_dict = {"key_stacksize" = 0, "key_item_data" = null} 
	item_dict["key_stacksize"] += 1
	item_dict["key_item_data"] = item
	inventory.append(item_dict)
	
func remove_item(item : ItemData):
	for inventory_item in inventory:
		if item == inventory_item["key_item_data"]:
			if inventory_item["key_stacksize"] == 0:
				inventory.erase(inventory_item)
			else: 
				inventory_item["key_stacksize"] -= 1


