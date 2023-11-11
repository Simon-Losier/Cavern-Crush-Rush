class_name PlayerInventory extends Node2D

@export var inventory : Array[InventoryItem]

func add_item(item : ItemData):
	var inventory_item : InventoryItem
	inventory_item.item_data = item
	inventory_item.stackszie += 1
	inventory.append(inventory_item)
	
func remove_item(item : ItemData):
	for inventory_item in inventory:
		if inventory_item.item_data == item:
			if inventory_item.stackszie == 0:
				inventory.erase(inventory_item)
			else:
				inventory_item.stackszie -= 1


