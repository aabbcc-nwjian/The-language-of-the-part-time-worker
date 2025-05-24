extends CanvasLayer

var nickname: String = "王小明"
var money: int = 0
var health: int = 100
var health_max: int = 100
var san: int = 100
var san_max: int = 100
var ability: int = 100
var ability_max: int = 100
		
@onready var nickname_label = $LabelNickName
@onready var money_label = $LabelMoney
@onready var health_label = $LabelHealth
@onready var san_label = $LabelMental
@onready var ability_label = $LabelAbility

func _ready() -> void:
	nickname = User.nick_name
	money = User.money
	health = User.health
	san = User.san
	ability = User.ability
	health_max = User.max_health
	san_max = User.max_san
	ability_max = User.max_ability
	
	_update_all()
	
	User.nickname_changed.connect(_on_nickname_changed)
	User.money_changed.connect(_on_money_changed)
	User.health_changed.connect(_on_health_changed)
	User.san_changed.connect(_on_san_changed)
	User.ability_changed.connect(_on_ability_changed)
	User.max_health_changed.connect(_on_max_health_changed)
	User.max_san_changed.connect(_on_max_san_changed)
	User.max_ability_changed.connect(_on_max_ability_changed)
	
func _on_nickname_changed(value: String) -> void:
	nickname = value
	_update_nickname()
	
func _on_money_changed(value: int) -> void:
	money = value
	_update_money()
	
func _on_health_changed(value: int) -> void:
	health = clamp(value, 0, health_max)
	_update_health()

func _on_max_health_changed(value: int) -> void:
	health_max = max(1, value)
	health = clamp(health, 0, health_max)
	_update_health()
	
func _on_san_changed(value: int) -> void:
	san = clamp(value, 0, san_max)
	_update_san()
	
func _on_max_san_changed(value: int) -> void:
	san_max = max(1, value)
	san = clamp(san, 0, san_max)
	_update_san()
	
func _on_ability_changed(value: int) -> void:
	ability = clamp(value, 0, ability_max)
	_update_ability()
	
func _on_max_ability_changed(value: int) -> void:
	ability_max = max(1, value)
	ability = clamp(ability, 0, ability_max)
	_update_ability()

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
