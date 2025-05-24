extends Node

# 获取工作日前的随机事件
func before_workday() -> GameEvent:
	return null

# 获取工作日中的随机事件
func during_workday() -> GameEvent:
	return null
	
# 获取工作日结束后的随机事件
func after_workday() -> GameEvent:
	return null
	
# 获取休息日的随机事件
func during_apartday() -> GameEvent:
	return null
