extends Node2D

## Variables
@onready var level_tile = $LevelTile

@export var door_data : DoorData

var rng : RandomNumberGenerator
var number : int

## Functions
func _ready() -> void:
	door_data.door_opened.connect(_next_level)
	# Create a new seed
	rng = RandomNumberGenerator.new()
	number = rng.randi_range(0, LevelDatabase.levels.size() - 1)

func _next_level() -> void:
	level_tile.queue_free()
	# Pick a level from the database
	var new_scene : Node = LevelDatabase.levels[number].instantiate()
	number = rng.randi_range(0, LevelDatabase.levels.size() - 1)
	# Load the new scene
	add_child(new_scene)
	door_data.doors_enabled = 0
	level_tile = new_scene
