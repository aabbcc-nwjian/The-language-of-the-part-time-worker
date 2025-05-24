extends VBoxContainer

signal option_selected(effect : Dictionary)

func set_options(options: Array):
	for i in range(get_child_count()):
		var btn = get_child(i)
		if btn is Button:
			if i < options.size():
				btn.text = options[i]["text"]
				btn.show()
				if btn.is_connected("pressed", Callable(self, "_on_option_pressed")):
					btn.disconnect("pressed", Callable(self, "_on_option_pressed"))
				btn.connect("pressed", Callable(self, "_on_option_pressed").bind(options[i]))
			else:
				btn.hide()

func _on_option_pressed(option_data:Dictionary):
	emit_signal("option_selected",option_data["effect"])
