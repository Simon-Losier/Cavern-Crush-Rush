class_name PlayerInventory extends Node2D

@export var inventory : Array[InventoryItem]

func add_item(item : ItemData):
	for inventory_item in inventory:
		if inventory_item.item_data == item && inventory_item.stackszie != inventory_item.max_stacksize:
			inventory_item.stackszie += 1
		else:
			var new_inventory_item : InventoryItem
			new_inventory_item.item_data = item
			new_inventory_item.stackszie += 1
			inventory.append(new_inventory_item)
			
func remove_item(item : ItemData):
	for inventory_item in inventory:
		if inventory_item.item_data == item:
			if inventory_item.stackszie == 0:
				inventory.erase(inventory_item)
			else:
				inventory_item.stackszie -= 1


