extends Node

func _on_button_new_game_pressed() -> void:
	var scene = load("res://scene/game_scene.tscn")
	get_tree().change_scene_to_packed(scene)

func _on_button_exit_pressed() -> void:
	get_tree().quit()

func _on_button_continue_pressed() -> void:
	var scene = load("res://scene/game_scene.tscn")
	get_tree().change_scene_to_packed(scene)
