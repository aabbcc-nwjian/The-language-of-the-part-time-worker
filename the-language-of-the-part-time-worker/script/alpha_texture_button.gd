extends TextureButton

func _ready():
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(texture_normal.get_image())
	texture_click_mask = bitmap
