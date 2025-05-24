extends Control

var balance: int = 0
@onready var balance_label = $Balance

func _ready() -> void:
	balance=User.money
	balance_label.text = '当前余额：'+str(balance)
