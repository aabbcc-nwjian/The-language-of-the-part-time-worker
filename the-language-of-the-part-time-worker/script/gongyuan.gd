extends Node2D

var scene_paths = {
	"map": "res://scene/ditu.tscn",
}

@onready var scene_container = $Node2D
@onready var accept_dialog1 = $Node2D/AcceptDialog
@onready var accept_dialog2 = $Node2D/AcceptDialog2
func _ready():
	$Node2D/Gongyuan/Control/Button1.pressed.connect(_on_back_pressed)
	$Node2D/VBoxContainer/Button.pressed.connect(run)
	$Node2D/VBoxContainer/Button2.pressed.connect(walk)

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
func run():
	accept_dialog1.popup_centered()
	User.mod_health(-15)
	User.mod_max_health(5)
	print(User.health)
	print(User.max_health)
func walk():
	accept_dialog2.popup_centered()
	User.mod_health(-5)
	User.mod_san(10)
	print(User.san)
	print(User.health)
