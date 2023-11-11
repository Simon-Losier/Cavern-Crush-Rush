class_name UIItemDataCarftingUI extends Control

@onready var item_image : TextureRect =  $TextureRect

func set_creafting_item_data_ui(item : ItemData):
	item_image.set_texture(item.item_image)
