extends Control

@export var color: Color = Color(0.2, 0.6, 1.0):
	set(value):
		color = value
		update_style()

@export var corner_radius: int = 10:
	set(value):
		corner_radius = max(0, value)  # 确保不小于0
		update_style()

func _ready():
	update_style()
	# 确保Control有足够大小
	custom_minimum_size = Vector2(100, 50)

func update_style():
	var style = StyleBoxFlat.new()
	style.bg_color = color
	
	# Godot 4中设置圆角半径的方式已改变
	style.set_corner_radius_all(corner_radius)
	
	# 可选：添加边框
	style.border_width_bottom = 2
	style.border_width_top = 2
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_color = color.darkened(0.3)
	
	# 应用样式到"panel"（Control的默认样式）
	add_theme_stylebox_override("panel", style)
	
	# 强制重绘
	queue_redraw()
