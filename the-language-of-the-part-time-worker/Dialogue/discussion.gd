extends CanvasLayer

signal option_selected(effect: Dictionary)

@onready var text_label = $dialogue/RichTextLabel
@onready var options_container = $options

func show_dialogue(text: String) -> void:
	text_label.text = text
	visible = true

func set_options(options: Array) -> void:
	# 清除现有选项
	for child in options_container.get_children():
		child.queue_free()
	
	# 添加新选项
	for option in options:
		var button = Button.new()
		button.text = option["text"]
		button.pressed.connect(func(): _on_option_pressed(option["effect"]))
		options_container.add_child(button)

func _on_option_pressed(effect: Dictionary) -> void:
	emit_signal("option_selected", effect)
