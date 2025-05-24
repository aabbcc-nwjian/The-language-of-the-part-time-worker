extends CanvasLayer

@export var nickname: String = "王小明":
	set(value):
		nickname = value
		_update_nickname()
	
@export var money: int = 0:
	set(value):
		money = value
		_update_money()
		
@export var health: int = 100:
	set(value):
		health = clamp(value, 0, health_max)
		_update_health()

@export var health_max: int = 100:
	set(value):
		health_max = max(1, value)
		health = clamp(health, 0, health_max)
		_update_health()
		
@export var san: int = 100:
	set(value):
		san = clamp(value, 0, san_max)
		_update_san()
		
@export var san_max: int = 100:
	set(value):
		san_max = max(1, value)
		san = clamp(san, 0, san_max)
		_update_san()
		
@export var ability: int = 100:
	set(value):
		ability = clamp(value, 0, ability_max)
		_update_ability()
		
@export var ability_max: int = 100:
	set(value):
		ability_max = max(1, value)
		ability = clamp(ability, 0, ability_max)
		_update_ability()
		
@onready var nickname_label = $LabelNickName
@onready var money_label = $LabelMoney
@onready var health_label = $LabelHealth
@onready var san_label = $LabelMental
@onready var ability_label = $LabelAbility

func _ready() -> void:
	_update_all()
	pass

func _update_all() -> void:
	_update_nickname()
	_update_money()
	_update_health()
	_update_san()
	_update_ability()
	pass
	
func _update_nickname() -> void:
	nickname_label.text = nickname
	pass
	
func _update_money() -> void:
	money_label.text = "%d" % money
	pass
	
func _update_health() -> void:
	health_label.text = "%d/%d" % [health, health_max]
	pass
	
func _update_san() -> void:
	san_label.text = "%d/%d" % [san, san_max]
	pass
	
func _update_ability() -> void:
	ability_label.text = "%d/%d" % [ability, ability_max]
	pass
