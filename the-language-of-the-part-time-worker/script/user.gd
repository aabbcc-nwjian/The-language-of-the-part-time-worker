extends Node

# 游戏进行的周期数
var cycle_num = 0
# 游戏阶段
# 0： 工作日白天
# 1： 工作日下班后
# 2： 休息日
var stage = 2

# 选择的出身
var choose = 0
# 居住的房间
var room := 0


# 能力属性
var nick_name := "张晓梅"
var money := 10000
var health := 100
var max_health := 100
var san := 100
var max_san := 100
var ability := 100
var max_ability := 100

# 定义不同房间的租金
var room_rent: int:
	get:
		if (room == 0):
			return -50
		if (room == 1):
			return -100
		if (room == 2):
			return -200
		else:
			return 50

# 定义不同房间的SAN回复值
var room_recovery: int:
	get:
		if (room == 0):
			return 50
		if (room == 1):
			return 80
		if (room == 2):
			return 150
		else:
			return 50

signal nickname_changed(new_value)
signal money_changed(new_value)
signal health_changed(new_value)
signal san_changed(new_value)
signal ability_changed(new_value)

signal max_health_changed(new_value)
signal max_san_changed(new_value)
signal max_ability_changed(new_value)

# 加减金钱
func mod_money(value: int) -> void:
	set_money(money + value)

# 加减健康值
func mod_health(value: int) -> void:
	set_health(health + value)
	
# 加减精神值
func mod_san(value: int) -> void:
	set_san(san + value)

# 加减能力值
func mod_ability(value: int) -> void:
	set_ability(ability + value)

# 加减最大健康值
func mod_max_health(value: int) -> void:
	set_max_health(max_health + value)

# 加减最大精神值
func mod_max_san(value: int) -> void:
	set_max_san(max_san + value)

# 加减最大能力值
func mod_max_ability(value: int) -> void:
	set_max_ability(max_ability + value)

# 设置昵称
func set_nickname(nickname: String) -> void:
	nick_name = nickname
	nickname_changed.emit(nickname)

# 设置金钱的绝对值
func set_money(value: int) -> void:
	money = value
	money_changed.emit(money)

# 设置健康的绝对值
func set_health(value: int) -> void:
	health = clamp(value, 0, max_health)
	health_changed.emit(health)

# 设置精神的绝对值
func set_san(value: int) -> void:
	san = clamp(value, 0, max_san)
	san_changed.emit(san)

# 设置能力的绝对值
func set_ability(value: int) -> void:
	ability = clamp(value, 0, max_ability)
	ability_changed.emit(ability)

# 设置最大健康的绝对值
func set_max_health(value: int) -> void:
	max_health = value
	max_health_changed.emit(value)
	set_health(clamp(health, 0, value))

# 设置最大精神的绝对值
func set_max_san(value: int) -> void:
	max_san = value
	max_san_changed.emit(value)
	set_san(clamp(san, 0, value))

# 设置最大能力的绝对值
func set_max_ability(value: int) -> void:
	max_ability = value
	max_ability_changed.emit(value)
	set_ability(clamp(ability, 0, value))



var item_list = []
var a = false
var b = false
var c = false
var d = false
var e = false
func add_item(name:String,price:float,description:String,page:int,reading:int,ability:int):
	var item = {
		"name":name,
		"price":price,
		"description":description,
		"page":page,
		"reading":reading,
		"ability":ability
	}
	item_list.append(item)
func get_item(index:int):
	return item_list[index]
func get_all_items():
	return item_list;
func readbook(index:int,num:int):
	if num + item_list[index].reading>=item_list[index].page:
		item_list[index].reading=item_list[index].page
	else :
		item_list[index].reading=num + item_list[index].reading
