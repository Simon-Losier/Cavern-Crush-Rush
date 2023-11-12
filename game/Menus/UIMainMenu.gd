extends Control

## Functions
func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://Levels/GameScene.tscn")

func _on_quit_game_button_pressed():
	get_tree().quit()
