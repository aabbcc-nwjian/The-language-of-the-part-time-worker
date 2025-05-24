extends Control

@onready var confirm_sleep = $ConfirmSleep
@onready var confirm_computer = $ConfirmComputer
@onready var progress_computer = $ProgressBar
@onready var computer_result = $PopupComputerResult
@onready var phone = $CanvasLayer/Phone

var _show_phone := false

func _show_room():
	if (User.room == 0):
		$Room1.show()
	elif (User.room == 1):
		$Room2.show()
	elif (User.room == 2):
		$Room3.show()
	else:
		$Room1.show()

func _ready() -> void:
	confirm_sleep.dialog_ok.connect(_on_confirm_sleep)
	confirm_computer.dialog_ok.connect(_on_confirm_computer)
	progress_computer.progress_complete.connect(_on_computer_finished)
	phone.hide_phone()
	_show_room()
	
func _on_computer_finished():
	computer_result.show_popup("金钱: -50  健康: -5\n精神: +10  能力上限: +2")
	User.mod_money(-50)
	User.mod_health(-5)
	User.mod_san(10)
	User.mod_max_ability(2)
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


func _on_book_shelf_pressed() -> void:
	var scene = load("res://scene/bookstores.tscn")
	get_tree().change_scene_to_packed(scene)
	pass # Replace with function body.


func _on_button_phone_pressed() -> void:
	if (_show_phone):
		phone.hide_phone()
	else:
		phone.show_phone()
	_show_phone = !_show_phone

func _on_button_map_pressed() -> void:
	var scene = load("res://scene/ditu.tscn")
	get_tree().change_scene_to_packed(scene)
	pass # Replace with function body.
