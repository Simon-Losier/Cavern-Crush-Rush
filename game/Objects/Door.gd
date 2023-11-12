extends Area2D

## Variables
# Each of our animated frames
@onready var elements : Array[AnimatedSprite2D] = [%DoorFrame, %LeftHead, %LeftFountain, %RightHead, %RightFountain]
# Is the door opened? Both doors need to be opened in order for the next level to be loaded
var activated : bool = false
# Player inventory
@export var player_1_inventory : PlayerInventory 
@export var player_2_inventory : PlayerInventory
# Door resource
@export var door_data : DoorData

## Functions
func _ready():
	# Connect signals
	player_1_inventory.exchanging_item.connect(_toggle_state)
	player_2_inventory.exchanging_item.connect(_toggle_state)

func _toggle_state(is_player_1 : bool):
	# First, check if there is a player in this area
	if(has_overlapping_bodies()):
		var bodies : Array[Node2D] = get_overlapping_bodies()
		# Is the door the same as the player. If so, toggle this door
		if((bodies[0].is_player_1 && is_player_1) or (bodies[0].is_player_1 == false && is_player_1 == false)):
			if(activated):
				for i in elements:
					i.play("closed")
				door_data.doors_enabled -= 1
			else:
				for i in elements:
					i.play("open")
				door_data.doors_enabled += 1
			activated = !activated
