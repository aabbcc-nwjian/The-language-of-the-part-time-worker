extends Control

@onready var confirm_sleep = $ConfirmSleep
@onready var confirm_computer = $ConfirmComputer
@onready var progress_computer = $ProgressBar
@onready var computer_result = $PopupComputerResult
@onready var phone = $CanvasLayer/Phone

var _show_phone := false

func _show_room():
	if (User.room == 0):
		$Room1.show()
	elif (User.room == 1):
		$Room2.show()
	elif (User.room == 2):
		$Room3.show()
	else:
		$Room1.show()

func _ready() -> void:
	confirm_sleep.dialog_ok.connect(_on_confirm_sleep)
	confirm_computer.dialog_ok.connect(_on_confirm_computer)
	progress_computer.progress_complete.connect(_on_computer_finished)
	phone.hide_phone()
	_show_room()
	
	# 只有休息日才能外出
	if (User.stage == 2):
		$Actions/ButtonMap.show()
	else:
		$Actions/ButtonMap.hide()
	
func _on_computer_finished():
	computer_result.show_popup("金钱: -50  健康: -5\n精神: +10  能力上限: +2")
	User.mod_money(-50)
	User.mod_health(-5)
	User.mod_san(10)
	User.mod_max_ability(2)
	pass
	
func _on_bed_pressed() -> void:
	confirm_sleep.show_popup_ok_cancel("确认要睡觉吗")
	pass # Replace with function body.

func _on_confirm_sleep():
	var scene = load("res://scene/daily_summary.tscn")
	get_tree().change_scene_to_packed(scene)
	pass

func _on_confirm_computer():
	var random_index = randi_range(0, _game_list.size() - 1)
	var title = _game_list[random_index]
	progress_computer.show_progress(title, 5)
	pass

func _on_computer_pressed() -> void:
	confirm_computer.show_popup_ok_cancel("确认玩电脑吗？（概率性减少金钱和健康，提升精神值和能力上限）")
	pass # Replace with function body.


func _on_book_shelf_pressed() -> void:
	var scene = load("res://scene/bookstores.tscn")
	get_tree().change_scene_to_packed(scene)
	pass # Replace with function body.


func _on_button_phone_pressed() -> void:
	if (_show_phone):
		phone.hide_phone()
	else:
		phone.show_phone()
	_show_phone = !_show_phone


func _on_button_map_pressed() -> void:
	var scene = load("res://scene/ditu.tscn")
	get_tree().change_scene_to_packed(scene)
	pass # Replace with function body.
	
var _game_list = [
	"正在《OW》中问候队友的亲人",  
	"正在《LOL》里0-21但嘴硬",  
	"正在《原神》里捡垃圾",  
	"正在《CS2》里当人体描边大师",  
	"正在《PUBG》里伏地当老六",  
	"正在《老头环》里被大树守卫军训",  
	"正在《星露谷》里种田养老",  
	"正在《GTA》里和警察激情对射",  
	"正在《Minecraft》里苦力怕偷袭中",  
	"正在《DOTA2》里甩锅给队友",  
	"正在《塞尔达》里追呀哈哈",  
	"正在《Apex》里落地成盒",  
	"正在《FF14》里挂机跳舞",  
	"正在《糖豆人》里被阴险机关制裁",  
	"正在《魔兽世界》里跑尸中",  
	"正在《DNF》里搬砖到意识模糊",  
	"正在《王者荣耀》里怒喷匹配机制",  
	"正在《2077》里和强尼银手拌嘴",  
	"正在《怪物猎人》里被龙车创飞",  
	"正在《文明6》里“再玩一回合”到天亮"
]
