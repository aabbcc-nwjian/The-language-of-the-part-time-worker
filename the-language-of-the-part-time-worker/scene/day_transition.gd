extends Control

func _ready() -> void:
	# 工作日
	if (User.stage == 0):
		$BackgroundWeekday.show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scene/office.tscn")
	# 休息日
	elif (User.stage == 2):
		$BackgroundWeekend.show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scene/my_home.tscn")
