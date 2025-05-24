extends Node2D

# 场景资源路径字典
var scene_paths = {
	"game_scene": "res://scene/game_scene.tscn",
	"gongyuan": "res://scene/gongyuan.tscn"
}

@onready var scene_container = $StartupPage
func _ready():
	$Control/Button.pressed.connect(_on_HomeButton_pressed)
	

# 加载场景的核心方法
func load_scene(scene_key: String):
	# 1. 清除当前场景
	for child in scene_container.get_children():
		child.queue_free()
	
	# 2. 加载新场景
	var scene_resource = load(scene_paths[scene_key])
	var new_scene = scene_resource.instantiate()  # Godot 4 中使用 instantiate() 而不是 instance()
	scene_container.add_child(new_scene)
	

func _on_HomeButton_pressed():
	load_scene("game_scene")
