class_name PlayerInventory extends Resource

## Signals
signal inventory_updated
signal exchanging_item(is_player_1 : bool)

## Variables
@export var inventory : Array[InventoryItem]

## Functions
func add_item(item : ItemData) -> void:
	print("Adding item")
	var stackable = false
	
	for inventory_item in inventory:
		# If an item already exists in the inventory, increment the stack of the item by one
		if inventory_item.item_data == item && inventory_item.stackszie != inventory_item.max_stacksize:
			inventory_item.stackszie += 1
			stackable = true
			
	if (!stackable):
		var new_inventory_item : InventoryItem = InventoryItem.new()
		new_inventory_item.item_data = item
		new_inventory_item.stackszie += 1
		inventory.append(new_inventory_item)
		
	emit_signal("inventory_updated")
			
func remove_item(item : ItemData) -> void:
	print("Removing item")
	for inventory_item in inventory:
		if inventory_item.item_data == item:
			# If there is no more items in the stack, remove the item from the inventory entirely
			if inventory_item.stackszie <= 1:
				inventory.erase(inventory_item)
			# Otherwise, only deduct the stack by one
			else:
				inventory_item.stackszie -= 1
	emit_signal("inventory_updated")

