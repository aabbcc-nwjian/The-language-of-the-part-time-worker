extends Control

var loan:int = 0
var balance: int = 0
static var loanCount:int = 3;
static var returnLoan:int = 0;
@onready var balance_label = $BankLayer/balance
@onready var loanCount_label = $BankLayer/loanCount
@onready var returnLoan_label = $AcceptDialog3/returnLoan
@onready var accept_dialog = $AcceptDialog
@onready var accept_dialog2 = $AcceptDialog2
@onready var accept_dialog3 = $AcceptDialog3
@onready var accept_dialog4 = $AcceptDialog4
@onready var accept_dialog5 = $AcceptDialog5
func _ready() -> void:
	balance=User.money
	balance_label.text = str(balance)
	loanCount_label.text="剩余贷款次数："+str(loanCount)
	returnLoan_label.text="当前欠款："+str(returnLoan)+"\n 是否选择还款"



func _update_money() -> void:
	balance_label.text =str(User.money)
	pass
	
func _update_loanCount() -> void:
	loanCount_label.text="剩余贷款次数："+str(loanCount)
	pass
	
func _update_returnLoan() -> void:
	returnLoan_label.text="当前欠款："+str(returnLoan)+"\n 是否选择还款"
	pass


func _on_accept_dialog_confirmed() -> void:
	loanCount -= 1;
	returnLoan+=loan*1.3
	User.mod_money(loan)
	_update_money()
	_update_loanCount()
	_update_returnLoan()
	print(User.money)
	print(loanCount)
	print(returnLoan)
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
	get_tree().change_scene_to_file("res://scene/phone.tscn")
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	if(loan>0&&loanCount>0):
		accept_dialog.popup()
		_on_accept_dialog_confirmed()
	else:
		accept_dialog2.popup()
	pass # Replace with function body.


func _on_accept_dialog_2_confirmed() -> void:
	pass # Replace with function body.


func _on_return_pressed() -> void:
	accept_dialog3.popup()
	pass # Replace with function body.


func _on_accept_dialog_3_confirmed() -> void:
	if(User.money>returnLoan):
		User.mod_money(-returnLoan)
		returnLoan=0
		accept_dialog4.popup()
	else:
		accept_dialog5.popup()


func _on_accept_dialog_4_confirmed() -> void:
	_update_money()
	_update_loanCount()
	pass # Replace with function body.


func _on_accept_dialog_5_confirmed() -> void:
	pass # Replace with function body.
