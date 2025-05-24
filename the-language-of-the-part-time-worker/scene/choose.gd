extends Node2D

var scene_paths = {
	"office": "res://scene/office.tscn",
}

@onready var scene_container = $Node2D
@onready var accept_dialog = $AcceptDialog
func _ready():
	$Node2D/Control/Button1.pressed.connect(choose_f)
	$Node2D/Control/Button2.pressed.connect(choose_s)
	$Node2D/Control/Button3.pressed.connect(choose_t)
	accept_dialog.confirmed.connect(on_accept_dialog)

func load_scene(scene_key: String):
	# 清除旧场景
	for child in scene_container.get_children():
		child.queue_free()
	
	# 加载新场景
	var scene_resource = load(scene_paths[scene_key])
	var new_scene = scene_resource.instantiate()
	scene_container.add_child(new_scene)
	
	# 确保新场景位置正确（关键修复）
	new_scene.position = Vector2.ZERO
	new_scene.scale = Vector2.ONE
var thechoose = 0
func choose_f():
	thechoose = 1
	accept_dialog.popup_centered()
func choose_s():
	thechoose = 2
	accept_dialog.popup_centered()
func choose_t():
	thechoose = 3
	accept_dialog.popup_centered()
func on_accept_dialog():

	if thechoose == 1:
		choose_first()
	elif thechoose == 2:
		choose_second()
	elif thechoose == 3:
		choose_three()

func choose_first():
	User.money =5000
	User.health =100
	User.max_health =100
	User.san =100
	User.max_san =100
	User.ability = 100
	User.max_ability = 100
	load_scene("office")
func choose_second():
	User.money =8000
	User.health =120
	User.max_health =120
	User.san =100
	User.max_san =100
	User.ability = 100
	User.max_ability = 100
	load_scene("office")
func choose_three():
	User.money =15000
	User.health =100
	User.max_health =100
	User.san =100
	User.max_san =100
	User.ability = 80
	User.max_ability = 80
	load_scene("office")
