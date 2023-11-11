class_name ItemDataUI extends Control

@onready var item_image : TextureRect = $ImageTextureRect 
@onready var item_stacksize_label : Label = $StacksizeLabel

func set_ui_item_data(item : ItemData):
	item_image.set_texture(item.item_image)

