extends Control

func hide_phone():
	hide()
	
func show_phone():
	show()

func _on_button_pressed() -> void:
	print("按钮被点击了！")
	# 加载嵌套场景
	var scene = load("res://mobile/apps/Bank.tscn")
	if scene:
		# 实例化场景
		var instance = scene.instantiate()
		# 将实例添加到 AppContainer 节点下
		get_node("/root/mobile/AppContainer").add_child(instance)
		# 隐藏所有按钮
		get_node("/root/mobile/CanvasLayer/Button").hide()
		get_node("/root/mobile/CanvasLayer/Button2").hide()
		get_node("/root/mobile/CanvasLayer/Button3").hide()
	else:
		print("场景加载失败！")


func _on_button_2_pressed() -> void:
	print("按钮被点击了！")
	# 加载嵌套场景
	var scene = load("res://mobile/apps/Company.tscn")
	if scene:
		# 实例化场景
		var instance = scene.instantiate()
		# 将实例添加到 AppContainer 节点下
		get_node("/root/mobile/AppContainer").add_child(instance)
		# 隐藏所有按钮
		get_node("/root/mobile/CanvasLayer/Button").hide()
		get_node("/root/mobile/CanvasLayer/Button2").hide()
		get_node("/root/mobile/CanvasLayer/Button3").hide()
	else:
		print("场景加载失败！")


func _on_button_3_pressed() -> void:
	print("按钮被点击了！")
	# 加载嵌套场景
	var scene = load("res://mobile/apps/Job.tscn")
	if scene:
		# 实例化场景
		var instance = scene.instantiate()
		# 将实例添加到 AppContainer 节点下
		get_node("/root/mobile/AppContainer").add_child(instance)
		# 隐藏所有按钮
		get_node("/root/mobile/CanvasLayer/Button").hide()
		get_node("/root/mobile/CanvasLayer/Button2").hide()
		get_node("/root/mobile/CanvasLayer/Button3").hide()
	else:
		print("场景加载失败！")
