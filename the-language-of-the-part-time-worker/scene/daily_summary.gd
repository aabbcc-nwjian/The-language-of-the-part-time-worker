extends Control


func _on_button_continue_pressed() -> void:
	_recovery_status()
	pass # Replace with function body.

# 结算每日状态
func _recovery_status():
	# 能力回满
	User.set_ability(User.max_ability)
	# 精神根据房间恢复
	User.mod_san(User.room_recovery)
	# 结算房租
	User.mod_money(User.room_rent)
