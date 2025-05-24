extends CanvasLayer

@onready var house = $AppLayer/ApphouseScene
@onready var bank = $AppLayer/AppbankScene
@onready var job = $AppLayer/AppjobScene

func show_phone():
	show()
	$SubViewport.show()
	$AppLayer.show()

func hide_phone():
	hide()
	hide_all_app()
	$SubViewport.hide()
	$AppLayer.hide()

func hide_all_app():
	house.hide()
	bank.hide()
	job.hide()
	

func _on_bank_app_pressed() -> void:
	var path = "appbank_scene.tscn"
	hide_all_app()
	bank.show()
	$SubViewport.hide()


func _on_company_app_pressed() -> void:
	var path = "apphouse_scene.tscn"
	hide_all_app()
	house.show()
	$SubViewport.hide()


func _on_job_app_pressed() -> void:
	var path = "appjob_scene.tscn"
	hide_all_app()
	job.show()
	$SubViewport.hide()
