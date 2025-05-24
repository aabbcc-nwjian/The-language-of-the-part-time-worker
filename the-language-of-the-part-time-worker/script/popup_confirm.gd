extends CanvasLayer

signal dialog_ok()
signal dialog_cancel()

func _ready() -> void:
	hide()

func _on_button_ok_pressed() -> void:
	hide()
	dialog_ok.emit()

func _on_button_cancel_pressed() -> void:
	hide()
	dialog_cancel.emit()
	
func show_popup_ok_cancel(content: String, title: String = "提示") -> void:
	$Control/Content.text = content
	$Control/Title.text = title
	show()
