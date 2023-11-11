extends HBoxContainer

@export var player_inventory : PlayerInventory

@export var crafting_data : CraftingData
@export var crafting_list : Array[UIItemDataCarftingUI]

@onready var crafting_button = $CraftingItemButton/Button

func _ready():
	set_crafting_button_ui()
	set_crafting_list_ui()

func set_crafting_button_ui():
	crafting_button.icon = crafting_data.item_to_craft.item_image 

func set_crafting_list_ui():
	for i in crafting_list.size():
		if crafting_data.crafting_items[i]:
			crafting_list[i].set_creafting_item_data_ui(crafting_data.crafting_items[i])
			crafting_list[i].show()
		else:
			crafting_list[i].hide()

func _on_button_pressed():
	crafting()
		
func check_player_has_all_crafting_item_in_inventory():
	var player_has_items : bool = false
	
	for i in crafting_data.crafting_items.size():
		player_has_items = check_player_has_item_in_inventory(crafting_data.crafting_items[i])
		
	return player_has_items

func check_player_has_item_in_inventory(item : ItemData) -> bool:
	for item_player_inventory in player_inventory.inventory:
		if item == item_player_inventory:
			return true
			
	return false

func crafting():
	if check_player_has_all_crafting_item_in_inventory():
		for item_player_inventory in player_inventory.inventory:
			player_inventory.remove_item(item_player_inventory.item_data)
		
		player_inventory.add_item(crafting_data.item_to_craft)
