extends Node2D

@onready var hud = $UserHud

func _ready() -> void:
	hud.nickname = "张小美"
	hud.health_max = 80
