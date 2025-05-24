extends Node

func _on_button_new_game_pressed() -> void:
	var scene_path: String
	if User.choose == 0:
		scene_path = "res://scene/choose.tscn"  # 修正了拼写错误 chosse → choose
	else:
		scene_path = "res://scene/office.tscn"
	
	var scene = load(scene_path)
	if scene:
		get_tree().change_scene_to_packed(scene)
	else:
		push_error("无法加载场景: " + scene_path)

func _on_button_exit_pressed() -> void:
	get_tree().quit()

func _on_button_continue_pressed() -> void:
	var scene = load("res://scene/game_scene.tscn")
	get_tree().change_scene_to_packed(scene)
