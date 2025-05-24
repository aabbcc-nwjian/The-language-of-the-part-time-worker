extends Node2D
var scene_paths = {
	"map": "res://scene/ditu.tscn",
}
@onready var item_storage=$ownbooks
@onready var scene_container = $Node2D
@onready var buybook1 = $Node2D/VBoxContainer/A3995f8d33a4b46Bf86f5Ab89c5c60Fc
@onready var buybook2 = $Node2D/VBoxContainer/A3995f8d33a4b46Bf86f5Ab89c5c60Fc2
@onready var buybook3 = $Node2D/VBoxContainer/A3995f8d33a4b46Bf86f5Ab89c5c60Fc3
@onready var buybook4 = $Node2D/VBoxContainer/A3995f8d33a4b46Bf86f5Ab89c5c60Fc4
@onready var buybook5 = $Node2D/VBoxContainer/A3995f8d33a4b46Bf86f5Ab89c5c60Fc5
func _ready():
	buybook1.visible=User.a
	buybook2.visible=User.b
	buybook3.visible=User.c
	buybook4.visible=User.d
	buybook5.visible=User.e
	$Node2D/Control/Button.pressed.connect(_on_back_pressed)
	$Node2D/Control/Button2.pressed.connect(buy_first)
	$Node2D/Control/Button3.pressed.connect(buy_second)
	$Node2D/Control/Button4.pressed.connect(buy_three)
	$Node2D/Control/Button5.pressed.connect(buy_four)
	$Node2D/Control/Button6.pressed.connect(buy_five)

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
func buy_first():
	if User.money >= 100 and not buybook1.visible:
		buybook1.visible=true
		User.a = true
		User.mod_money(-100)
		User.add_item("java",100,"能力10+",160,0,10)
func buy_second():
	if User.money >= 200 and not buybook2.visible:
		buybook2.visible=true
		User.b = true
		User.mod_money(-200)
		User.add_item("c++",200,"能力25+",200,0,25)
func buy_three():
	if User.money >= 400 and not buybook3.visible:
		buybook3.visible=true
		User.c = true
		User.mod_money(-400)
		User.add_item("Godot",400,"能力20+",100,0,20)
func buy_four():
	if User.money >= 300 and not buybook4.visible:
		buybook4.visible=true
		User.d = true
		User.mod_money(-300)
		User.add_item("c#",300,"能力30+",220,0,30)
func buy_five():
	if User.money >= 300 and not buybook5.visible:
		buybook5.visible=true
		User.e = true
		User.mod_money(-300)
		User.add_item("css",300,"能力20+",160,0,20)
