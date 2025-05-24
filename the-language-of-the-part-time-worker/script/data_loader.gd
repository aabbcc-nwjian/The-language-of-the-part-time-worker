# task_manager.gd
extends Node

var tasks: Array[WorkItem] = []

func _ready() -> void:
	_load_tasks()

func _load_tasks(path: String = "res://data/works.json") -> bool:
	var file = FileAccess.open(path, FileAccess.READ)
	if not file:
		push_error("无法加载任务文件: ", path)
		return false
	
	var json_data = JSON.parse_string(file.get_as_text())
	file.close()
	
	if not json_data is Array:
		push_error("任务数据格式错误")
		return false
	
	for task_data in json_data:
		var task = WorkItem.new()
		task.title = task_data.get("title", "")
		task.desc = task_data.get("desc", "")
		task.money = task_data.get("money", 0)
		task.health = task_data.get("health", 0)
		task.san = task_data.get("san", 0)
		task.ability = task_data.get("ability", 0)
		tasks.append(task)
	
	print("成功加载", tasks.size(), "个任务")
	return true

func get_random_task() -> WorkItem:
	if tasks.is_empty():
		return null
	return tasks.pick_random()
