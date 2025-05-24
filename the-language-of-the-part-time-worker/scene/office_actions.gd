extends Node2D

func _ready() -> void:
	$ProgressBar.progress_complete.connect(_on_progress_finished)

func _disable_actions() -> void:
	$Actions/DoFishing.disabled = true
	$Actions/DoPhone.disabled = true
	$Actions/DoFinishWork.disabled = true

func _enable_actions() -> void:
	$Actions/DoFishing.disabled = false
	$Actions/DoPhone.disabled = false
	$Actions/DoFinishWork.disabled = false

var _last_action: String

func _on_do_fishing_pressed() -> void:
	if (User.ability == 0):
		pass
		
	_disable_actions()
	_last_action = "fishing"
	var random_index = randi_range(0, _fishing_list.size())
	var title = _fishing_list[random_index]
	$ProgressBar.show_progress(title, 3)

func _on_progress_finished() -> void:
	_enable_actions()
	if (_last_action == "fishing"):
		User.mod_ability(-20)
		User.mod_max_ability(-5)
		User.mod_san(10)
	
var _fishing_list = [
	"正在假装思考",
	"正在神游宇宙",
	"正在刷短视频",
	"正在灵魂出窍",
	"正在偷偷吃零食",
	"正在研究星座运势",
	"正在网上激情对线",
	"正在摸鱼摸到深海",
	"正在等下班倒计时",
	"正在和同事眼神交流（八卦）",
	"正在发呆（CPU过载）",
	"正在偷偷看剧",
	"正在写辞职信（幻想版）",
	"正在计算摸鱼性价比",
	"正在假装调试代码",
]
