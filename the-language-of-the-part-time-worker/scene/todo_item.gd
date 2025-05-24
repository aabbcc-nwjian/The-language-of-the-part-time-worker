extends Control

signal delete_item(item: Node)

var money_mod := 0:
	set(value):
		money_mod = value
		$LabelMoney.text = "%d" % value
		
var health_mod := 0:
	set(value):
		health_mod = value
		$LabelHealth.text = "%d" % value
		
var san_mod := 0:
	set(value):
		san_mod = value
		$LabelSan.text = "%d" % value
		
var max_ability_mod := 0:
	set(value):
		max_ability_mod = value
		$LabelAbility.text = "%d" % value
		
var title := "":
	set(value):
		title = value
		$LabelTitle.text = value
		
var desc := "":
	set(value):
		desc = value
		$LabelDesc.text = value

func apply():
	User.mod_money(money_mod)
	User.mod_health(health_mod)
	User.mod_san(san_mod)
	User.mod_max_ability(max_ability_mod)
	

func _ready() -> void:
	User.san_changed.connect(_on_san_changed)
	var style = StyleBoxFlat.new()
	style.bg_color = Color.TRANSPARENT
	add_theme_stylebox_override("panel", style)
	
func _on_san_changed(value: int):
	if (value == 0):
		health_mod -= 10
	

func _on_texture_button_pressed() -> void:
	if (User.san + san_mod < 0):
		$Popup.show_popup("精神值不足，无法进行该工作")
		return
	$PopupConfirm.show_popup_ok_cancel("确定进行该工作？")
	pass # Replace with function body.


func _on_popup_confirm_dialog_ok() -> void:
	delete_item.emit(self)
	pass # Replace with function body.
