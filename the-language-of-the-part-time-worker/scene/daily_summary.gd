extends Control

func _ready() -> void:
	$DiffMoney.text = "%d" % User.acc_money
	$DiffSan.text = "%d" % User.acc_san
	$DiffHealth.text = "%d" % User.acc_health
	$DiffAbility.text = "%d" % User.acc_max_ability

func _on_button_continue_pressed() -> void:
	_recovery_status()
	_goto_next_day()
	
	User.acc_money = 0
	User.acc_san = 0
	User.acc_health = 0
	User.acc_max_ability = 0
	
	pass # Replace with function body.

func _goto_next_day():
		# 工作日下班后，跳到下一个休息日
	if (User.stage == 1):
		User.stage = 2
	# 休息日结束，跳到下一个工作日
	elif (User.stage == 2):
		User.stage = 0
	# 只有调试的时候才会走到这
	else:
		User.stage = 0
	# 推进周期数
	User.cycle_num += 1
	if (User.cycle_num < User.max_cycle):
		get_tree().change_scene_to_file("res://scene/day_transition.tscn")

# 结算每日状态
func _recovery_status():
	# 能力回满
	User.set_ability(User.max_ability)
	# 精神根据房间恢复
	User.mod_san(User.room_recovery)
	# 结算房租
	User.mod_money(User.room_rent)
	
	User.times = 3
