extends Node2D
@export var label_text: String = "Java"
@export var label2_text: int = 100
@export var label3_text: String = "能力10+"
@export var label4_text: int = 150
@onready var name_label = $Label
@onready var price_label = $HBoxContainer/Label2
@onready var gain_label = $HBoxContainer/Label3
@onready var page_label = $HBoxContainer/Label4
func _ready() -> void:
	name_label.text = label_text
	price_label.text = str(label2_text)
	gain_label.text = label3_text
	page_label.text = str(label4_text)
