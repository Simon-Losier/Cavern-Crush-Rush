extends Area2D

## Variables
@export var minecart_inventory : PlayerInventory 
@export var player_1_inventory : PlayerInventory 
@export var player_2_inventory : PlayerInventory

## Functions
func _ready():
	# Connect signals
	player_1_inventory.exchanging_item.connect(_check_players)
	player_2_inventory.exchanging_item.connect(_check_players)
	
# Check if the player is trying to exchange with this. If so, put items from one into another
func _check_players(is_player_1 : bool):
	# First, check if there is a player in this area
	if(has_overlapping_bodies()):
		var bodies : Array[Node2D] = get_overlapping_bodies()
		# Player 1
		if(bodies[0].is_player_1 && is_player_1):
			_exchange_items(player_1_inventory)
		# Player 2
		elif(bodies[0].is_player_1 == false && !is_player_1):
			_exchange_items(player_2_inventory)

func _exchange_items(player_inventory : PlayerInventory):
	# If the minecart has items, give them to the player
	if(minecart_inventory.inventory.size() != 0):
		for item in minecart_inventory.inventory:
			player_inventory.add_item(item.item_data)
			minecart_inventory.remove_item(item.item_data)
	# Otherwise, put the items from the player into the minecart
	else:
		for item in player_inventory.inventory:
			minecart_inventory.add_item(item.item_data)
			player_inventory.remove_item(item.item_data)
