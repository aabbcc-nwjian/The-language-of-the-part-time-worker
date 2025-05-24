extends Node2D

@onready var discussion_node = $CanvasLayer/Discussion

var event_list: Array = [] 
var current_event: Dictionary = {}

func _ready() -> void:
	randomize()
	load_event_data()
	trigger_random_event()
	
	# 连接信号
	if discussion_node:
		discussion_node.option_selected.connect(_on_option_selected)
	else:
		print("错误：找不到对话节点")

func load_event_data() -> void:
	var file := FileAccess.open("res://Events/park.json", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var json = JSON.new()
		var result = json.parse(content)
		if result == OK:
			event_list = json.data
		else:
			print("JSON 解析失败")
	else:
		print("无法打开事件文件：res://Events/park.json")
	file.close()

func trigger_random_event() -> void:
	if event_list.is_empty():
		print("无可用事件数据")
		return
	
	var random_index := randi() % event_list.size()
	current_event = event_list[random_index]
	
	if discussion_node:
		discussion_node.show_dialogue(current_event["description"])
		discussion_node.set_options(current_event["options"])
	else:
		print("错误：找不到对话节点")

func _on_option_selected(effect: Dictionary) -> void:
	# 应用效果
	if "money" in effect:
		User.mod_money(effect["money"])
	if "san" in effect:
		User.mod_san(effect["san"])
	if "health" in effect:
		User.mod_health(effect["health"])
	if "ability" in effect:
		User.mod_ability(effect["ability"])
	
	# 触发下一个随机事件
	trigger_random_event()
