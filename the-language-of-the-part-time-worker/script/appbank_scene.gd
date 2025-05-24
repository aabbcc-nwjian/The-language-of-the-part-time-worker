extends Node2D

var loan:int = 1000
var balance: int = 0
@onready var balance_label = $BankLayer/balance
@onready var accept_dialog = $AcceptDialog

func _ready() -> void:
	balance=User.money
	balance_label.text = str(balance)
	



func _update_money() -> void:
	balance_label.text =str(User.money)
	pass


func _on_accept_dialog_confirmed(loan:int) -> void:
	User.mod_money(loan)
	_update_money()
	print(User.money)
	loan = 0


func _on_loan_1000_pressed() -> void:
	loan= 1000


func _on_loan_2000_pressed() -> void:
	loan = 2000

func _on_loan_3000_pressed() -> void:
	loan= 3000


func _on_loan_4000_pressed() -> void:
	loan= 4000


func _on_back_pressed() -> void:
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	accept_dialog.popup()
	_on_accept_dialog_confirmed(loan)
	pass # Replace with function body.
