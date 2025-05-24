extends Node2D

func loadApp(path:String) -> void:
	var scene_path: String
	scene_path="res://scene/"+path
	var scene = load(scene_path)
	if scene:
		get_tree().change_scene_to_packed(scene)
	else:
		push_error("无法加载场景: " + scene_path)
	

func _on_bank_app_pressed() -> void:
	var path = "appbank_scene.tscn"
	loadApp(path);


func _on_company_app_pressed() -> void:
	var path = "apphouse_scene.tscn"
	loadApp(path);


func _on_job_app_pressed() -> void:
	var path = "appjob_scene.tscn"
	loadApp(path);
