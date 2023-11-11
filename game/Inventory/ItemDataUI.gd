class_name ItemDataUI extends Control

@onready var item_image : TextureRect = $ImageTextureRect 
@onready var item_stacksize_label : Label = $StacksizeLabel

func set_ui_item_data(inventory_item):
	item_image.set_texture(inventory_item["key_item_data"].item_image)
	item_stacksize_label.text = str(inventory_item["key_stacksize"])
