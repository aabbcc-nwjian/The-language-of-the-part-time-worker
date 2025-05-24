extends Node2D

@onready var confirm_sleep = $ConfirmSleep
@onready var confirm_computer = $ConfirmComputer
@onready var progress_computer = $ProgressBar
@onready var computer_result = $PopupComputerResult

func _ready() -> void:
	confirm_sleep.dialog_ok.connect(_on_confirm_sleep)
	confirm_computer.dialog_ok.connect(_on_confirm_computer)
	progress_computer.progress_complete.connect(_on_computer_finished)
	
func _on_computer_finished():
	computer_result.show_popup("金钱: -50  健康: -5\n精神: +10  能力上限: +2")
	pass
	
func _on_bed_pressed() -> void:
	confirm_sleep.show_popup_ok_cancel("确认要睡觉吗")
	pass # Replace with function body.

func _on_confirm_sleep():
	var scene = load("res://scene/daily_summary.tscn")
	get_tree().change_scene_to_packed(scene)
	pass

func _on_confirm_computer():
	progress_computer.show_progress("正在玩电脑", 5)
	pass

func _on_computer_pressed() -> void:
	confirm_computer.show_popup_ok_cancel("确认玩电脑吗？（概率性减少金钱和健康，提升精神值和能力上限）")
	pass # Replace with function body.
