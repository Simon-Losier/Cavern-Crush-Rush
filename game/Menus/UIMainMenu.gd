extends Control

## Variables
@onready var button_sound_player : AudioStreamPlayer = %ButtonSound

## Functions
func _on_start_game_button_pressed():
	button_sound_player.play()

func _on_quit_game_button_pressed():
	button_sound_player.play()
	get_tree().quit()

func _on_button_sound_finished():
	get_tree().change_scene_to_file("res://Levels/GameScene.tscn")
