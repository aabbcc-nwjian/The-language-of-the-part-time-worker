extends CanvasLayer

signal progress_complete()

@onready var progress_bar = $Control/Bar
@onready var title_label = $Control/Title

func _ready() -> void:
	hide()
	
func show_progress(title: String, duration: float) -> void:
	title_label.text = title
	progress_bar.value = 0;
	show()
	var tween = create_tween()
	tween.finished.connect(_on_progress_complete)
	tween.tween_property(progress_bar, "value", 100, duration) \
		.set_ease(Tween.EASE_IN_OUT) \
		.set_trans(Tween.TRANS_LINEAR)


func _on_progress_complete() -> void:
	hide()
	progress_complete.emit()
