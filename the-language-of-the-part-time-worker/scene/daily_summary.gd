extends Control

@onready var now_money = $DiffMoney
@onready var now_san = $DiffSan
@onready var now_health=$DiffHealth
@onready var now_ability=$DiffAbility
func _ready() -> void:
	var m = User.money
	var s = User.san
	var h = User.health
	var a = User.ability
	now_money.text = str(m - User.l_money)
	now_san.text = str(s - User.l_san)
	now_health.text = str(h - User.l_health)
	now_ability.text = str(a - User.l_ability)
	User.l_money = m
	User.l_san = s
	User.l_health = h
	User.l_ability = a

func _on_button_continue_pressed() -> void:
	_recovery_status()
	_goto_next_day()
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
