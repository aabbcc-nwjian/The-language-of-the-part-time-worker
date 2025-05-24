extends Node2D

var scene_paths = {
	"map": "res://scene/ditu.tscn",
}

@onready var scene_container = $Node2D
@onready var accept_dialog1 = $Node2D/AcceptDialog
@onready var accept_dialog2 = $Node2D/AcceptDialog2
@onready var accept_dialog3 = $Node2D/AcceptDialog3
func _ready():
	$Node2D/Control/Button2.pressed.connect(_on_back_pressed)
	$Node2D/VBoxContainer/Button.pressed.connect(first)
	$Node2D/VBoxContainer/Button2.pressed.connect(second)
	$Node2D/VBoxContainer/Button3.pressed.connect(three)

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
	

func _on_back_pressed():
	load_scene("map")
func first():
	accept_dialog1.popup_centered()
	User.mod_health(10)
	User.mod_money(-50)
	print(User.money)
	print(User.health)
func second():
	accept_dialog2.popup_centered()
	User.mod_health(40)
	User.mod_money(-180)
	print(User.money)
	print(User.health)
func three():
	accept_dialog3.popup_centered()
	User.mod_health(100)
	User.mod_money(-400)
	print(User.money)
	print(User.health)
