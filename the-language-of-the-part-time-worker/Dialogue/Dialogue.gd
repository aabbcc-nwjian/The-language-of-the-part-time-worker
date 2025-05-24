# Dialogue.gd
extends CanvasLayer
@onready var text_label = $Panel/RichTextLabel

func show_dialogue(text: String) -> void:
	text_label.text = text
	visible = true
