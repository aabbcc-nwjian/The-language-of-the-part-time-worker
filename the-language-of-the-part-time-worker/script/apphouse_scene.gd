extends Node2D

var housePrice:int = 0;
@onready var accept_dialog = $AcceptDialog

func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	housePrice=5000;
	accept_dialog.popup() # Replace with function body.


func _on_button_2_pressed() -> void:
	housePrice=500;
	accept_dialog.popup() # Replace with function body.


func _on_button_3_pressed() -> void:
	housePrice=2000;
	accept_dialog.popup() # Replace with function body.


func _on_accept_dialog_confirmed() -> void:
	User.mod_money(-housePrice);
	print(User.money)
	pass # Replace with function body.
