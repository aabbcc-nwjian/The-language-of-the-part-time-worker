extends Node2D

var scene_paths = {
	"yiyuan": "res://scene/yiyuan.tscn",
	"gongyuan": "res://scene/gongyuan.tscn",
	"book": "res://scene/book.tscn",
	"shop": "res://scene/shop.tscn",
}

@onready var scene_container = $map
func _ready():
	$map/buttons/Button1.pressed.connect(_on_yiyuan_pressed)
	$map/buttons/Button2.pressed.connect(_on_gongyuan_pressed)
	$map/buttons/Button3.pressed.connect(_on_book_pressed)
	$map/buttons/Button4.pressed.connect(_on_shop_pressed)

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
	

func _on_gongyuan_pressed():
	load_scene("gongyuan")
func _on_yiyuan_pressed():
	load_scene("yiyuan")
func _on_book_pressed():
	load_scene("book")
func _on_shop_pressed():
	load_scene("shop")
