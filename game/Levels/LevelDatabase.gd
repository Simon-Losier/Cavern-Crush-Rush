extends Node

## Variables
# A list of level tiles the game can load
var levels : Array[PackedScene] = [
	preload("res://Levels/LevelA.tscn"),
	preload("res://Levels/LevelB.tscn"),
	preload("res://Levels/LevelC.tscn"),
	preload("res://Levels/LevelD.tscn"),
	preload("res://Levels/LevelE.tscn")
]
