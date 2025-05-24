extends Control

@onready var house = $AppLayer/ApphouseScene
@onready var bank = $AppLayer/AppbankScene
@onready var job = $AppLayer/AppjobScene

func _ready() -> void:
	hide_all_app()
	$SubViewport.show()
	$AppLayer.hide()

func show_phone():
	show()
	hide_all_app()
	$SubViewport.show()
	$AppLayer.hide()

func hide_phone():
	hide()

func hide_all_app():
	house.hide()
	bank.hide()
	job.hide()
	

func _on_bank_app_pressed() -> void:
	hide_all_app()
	bank.show()
	$SubViewport.hide()
	$AppLayer.show()

func _on_job_app_pressed() -> void:
	hide_all_app()
	job.show()
	$SubViewport.hide()
	$AppLayer.show()


func _on_house_app_pressed() -> void:
	hide_all_app()
	house.show()
	$SubViewport.hide()
	$AppLayer.show()
	pass # Replace with function body.
