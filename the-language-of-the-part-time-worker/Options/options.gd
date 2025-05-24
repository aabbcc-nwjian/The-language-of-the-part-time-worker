extends VBoxContainer

signal option_effect(effect : Dictionary)

func set_options(options: Array):
	for i in range(min(options.size(), get_child_count())):
		var btn = get_child(i)
		btn.text = options[i]["text"]
		btn.connect("pressed", Callable(self, "_on_option_pressed").bind(options[i]))
		
func _on_option_pressed(option_data: Dictionary):
	emit_signal("option_selected", option_data["effect"])
