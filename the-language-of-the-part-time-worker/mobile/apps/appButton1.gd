extends Button
func _ready():
	self.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
		var scene = load("res://mobile/mobile.tscn")
		get_tree().change_scene_to_packed(scene)
		
