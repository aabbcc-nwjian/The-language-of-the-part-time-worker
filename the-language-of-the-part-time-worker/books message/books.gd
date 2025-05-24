extends Node2D

# 使用setget监听属性变化
@export var label_text: String = "Java":
	set(value):
		label_text = value
		_update_name_label()
		
@export var label2_text: int = 100:
	set(value):
		label2_text = value
		_update_price_label()

@export var label3_text: String = "能力10+":
	set(value):
		label3_text = value
		_update_gain_label()

@export var label4_text: int = 150:
	set(value):
		label4_text = value
		_update_page_label()

# 节点引用
var name_label: Label
var price_label: Label
var gain_label: Label
var page_label: Label

func _ready():
	# 安全获取节点
	_initialize_nodes()
	# 初始更新
	_update_all_labels()

# === 初始化方法 ===
func _initialize_nodes():
	name_label = get_node("Label") as Label
	price_label = get_node("HBoxContainer/Label2") as Label
	gain_label = get_node("HBoxContainer/Label3") as Label
	page_label = get_node("HBoxContainer/Label4") as Label

# === 更新方法 ===
func _update_all_labels():
	_update_name_label()
	_update_price_label()
	_update_gain_label()
	_update_page_label()

func _update_name_label():
	if name_label:
		name_label.text = str(label_text)

func _update_price_label():
	if price_label:
		price_label.text = str(label2_text)

func _update_gain_label():
	if gain_label:
		gain_label.text = str(label3_text)

func _update_page_label():
	if page_label:
		page_label.text = str(label4_text)

# === 外部调用接口 ===
func update_all_values(name: String, price: int, gain: String, pages: int):
	"""一次性更新所有值"""
	label_text = name
	label2_text = price
	label3_text = gain
	label4_text = pages
