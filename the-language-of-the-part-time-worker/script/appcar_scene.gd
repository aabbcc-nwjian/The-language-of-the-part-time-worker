extends Control

var car_choose = -1;
@onready var acceptDialog = $AcceptDialog
@onready var label = $AcceptDialog/Label

func _on_sport_car_pressed() -> void:
	car_choose = 0
	pass # Replace with function body.


func _on_car_pressed() -> void:
	car_choose = 1
	pass # Replace with function body.


func _on_electric_bike_pressed() -> void:
	car_choose = 2
	pass # Replace with function body.


func _on_bike_pressed() -> void:
	car_choose = 3
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	print(car_choose)
	if car_choose == 0:
		label.text = str("是否购买跑车")
	elif car_choose == 1:
		label.text = str("是否购买汽车")
	elif car_choose == 2:
		label.text = str("是否购买电动车")
	elif  car_choose == 3:
		label.text = str("是否购买自行车")
	else:
		label.text = str("选择有误")
		
	acceptDialog.popup()
	pass # Replace with function body.

func purchase_fail() -> void:
	car_choose=-1
	label.text=str('余额不足')
	acceptDialog.popup();
	
func purchase_succeed() -> void:
	car_choose=-1
	label.text=str('购买成功')
	acceptDialog.popup();
		

func choose_first() -> void:
	if(User.money>=200):
		User.mod_money(-200)
		purchase_succeed()
	else:
		purchase_fail()
func choose_second() -> void:
	if(User.money>=100):
		User.mod_money(-100)
		purchase_succeed()
	else:
		purchase_fail()	
func choose_three() ->void:
	if(User.money>=50):
		User.mod_money(-50)
		purchase_succeed()
	else:
		purchase_fail()
func choose_four() -> void:
	if(User.money>25):
		User.mod_money(-25)
		purchase_succeed()
	else:
		purchase_fail()
	
	
func _on_accept_dialog_confirmed() -> void:
	if car_choose == 0:
		choose_first()
	elif car_choose == 1:
		choose_second()
	elif car_choose == 2:
		choose_three()
	elif  car_choose == 3:
		choose_four()
	pass # Replace with function body.
