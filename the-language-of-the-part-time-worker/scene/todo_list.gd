extends Control

@onready var vbox = $VBoxContainer
@onready var item_scene = preload("res://scene/todo_item.tscn")

var _progress_item: Node

func _ready() -> void:
	pass

func _on_delete_item(item: Node):
	_progress_item = item
	$ProgressBar.show_progress("正在%s" % item.title, 3)
	
func _on_progress_bar_progress_complete() -> void:
	_progress_item.apply()
	vbox.remove_child(_progress_item)
	_progress_item.queue_free()
	
	# 每做完一个，再添加一个
	var task = DataLoader.get_random_task()
	add_task_item(task.title, task.desc, task.money, task.health, task.san, task.ability)

func add_task_item(title: String, desc: String, money: int, health: int, san: int, ability: int):
	var item = item_scene.instantiate()
	item.money_mod = money
	item.health_mod = health
	item.san_mod = san
	item.max_ability_mod = ability
	item.title = title
	item.desc = desc
	
	item.delete_item.connect(_on_delete_item)
	
	vbox.add_child(item)
