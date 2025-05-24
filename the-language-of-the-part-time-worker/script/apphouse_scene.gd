extends Control

var housePrice: int = 0;
var room: int = 0;
@onready var accept_dialog = $AcceptDialog
@onready var dialog_content = $AcceptDialog/Label

func _ready() -> void:
	# 正在居住的房子不可选
	if (User.room == 0):
		$CanvasLayer/ButtonSmallRoom.disabled = true
	elif (User.room == 1):
		$CanvasLayer/ButtonApartment.disabled = true
	elif (User.room == 2):
		$CanvasLayer/ButtonBigHouse.disabled = true

# 租金押2付1，押金不退
func _on_button_pressed() -> void:
	room = 2
	housePrice = 400;
	dialog_content.text = "押金+搬家费：400\n每周租金：200"
	accept_dialog.popup() # Replace with function body.


func _on_button_2_pressed() -> void:
	room = 0
	housePrice = 100;
	dialog_content.text = "押金+搬家费：100\n每周租金：50"
	accept_dialog.popup() # Replace with function body.


func _on_button_3_pressed() -> void:
	room = 1
	housePrice = 200;
	dialog_content.text = "押金+搬家费：200\n每周租金：100"
	accept_dialog.popup() # Replace with function body.


func _on_accept_dialog_confirmed() -> void:
	User.mod_money(-housePrice);
	User.room = room
	print(User.money)
	
	var scene = load("res://scene/my_home.tscn")
	get_tree().change_scene_to_packed(scene)
	
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/phone.tscn")
	pass # Replace with function body.
