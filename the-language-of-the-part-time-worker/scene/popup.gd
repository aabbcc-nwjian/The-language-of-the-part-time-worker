extends CanvasLayer

func _ready() -> void:
	hide()

func _on_button_ok_pressed() -> void:
	hide()
	pass # Replace with function body.

func show_popup(content: String):
	$Control/Content.text = content
	show()
