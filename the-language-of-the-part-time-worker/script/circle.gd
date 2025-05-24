extends Control


func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.8, 0.2, 0.4)  # 粉红色
	
	# 设置圆角半径为尺寸的一半
	var size = min(rect_size.x, rect_size.y)
	style.set_corner_radius_all(size / 2)
	
	# 应用到节点
	add_theme_stylebox_override("panel", style)
	
	# 确保控件是正方形
	custom_minimum_size = Vector2(100, 100)
