extends Node2D
@onready var book1=$Node2D/Books
@onready var book2=$Node2D/Books2
@onready var book3=$Node2D/Books3
@onready var book4=$Node2D/Books4
@onready var book5=$Node2D/Books5
@onready var butotn1=$Node2D/Button
@onready var butotn2=$Node2D/Button2
@onready var butotn3=$Node2D/Button3
@onready var butotn4=$Node2D/Button4
@onready var butotn5=$Node2D/Button5
var l = User.item_list.size()
func _ready() -> void:
	$Node2D/Button.pressed.connect(read1)
	$Node2D/Button2.pressed.connect(read2)
	$Node2D/Button3.pressed.connect(read3)
	$Node2D/Button4.pressed.connect(read4)
	$Node2D/Button5.pressed.connect(read5)
	if l>4:
		butotn5.visible=true
		book5.visible=true
		book5.label_text = str(User.item_list[4]["name"])
		book5.label2_text = str(User.item_list[4]["price"])
		book5.label3_text = str(User.item_list[4]["description"])
		book5.label4_text = str(User.item_list[4]["page"]-User.item_list[4]["reading"])
	if l>3:
		butotn4.visible=true
		book4.visible=true
		book4.label_text = str(User.item_list[3]["name"])
		book4.label2_text = str(User.item_list[3]["price"])
		book4.label3_text = str(User.item_list[3]["description"])
		book4.label4_text = str(User.item_list[3]["page"]-User.item_list[3]["reading"])
	if l>2:
		butotn3.visible=true
		book3.visible=true
		book3.label_text = str(User.item_list[2]["name"])
		book3.label2_text = str(User.item_list[2]["price"])
		book3.label3_text = str(User.item_list[2]["description"])
		book3.label4_text = str(User.item_list[2]["page"]-User.item_list[2]["reading"])
	if l>1:
		butotn2.visible=true
		book2.visible=true
		book2.label_text = str(User.item_list[1]["name"])
		book2.label2_text = str(User.item_list[1]["price"])
		book2.label3_text = str(User.item_list[1]["description"])
		book2.label4_text = str(User.item_list[1]["page"]-User.item_list[1]["reading"])
	if l>0:
		butotn1.visible=true
		book1.visible=true
		book1.label_text = str(User.item_list[0]["name"])
		book1.label2_text = str(User.item_list[0]["price"])
		book1.label3_text = str(User.item_list[0]["description"])
		book1.label4_text = str(User.item_list[0]["page"]-User.item_list[0]["reading"])
func read1():
	if User.item_list[0]["page"]!=User.item_list[0]["reading"]+20:
		User.item_list[0]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(-10)
	if User.item_list[0]["page"]!=User.item_list[0]["reading"]+20:
		User.item_list[0]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(10)
		User.mod_ability(User.item_list[0]["ability"])
func read2():
	if User.item_list[1]["page"]!=User.item_list[1]["reading"]+20:
		User.item_list[1]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(-10)
	if User.item_list[1]["page"]!=User.item_list[1]["reading"]+20:
		User.item_list[1]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(10)
		User.mod_ability(User.item_list[1]["ability"])
func read3():
	if User.item_list[2]["page"]!=User.item_list[2]["reading"]+20:
		User.item_list[2]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(-10)
	if User.item_list[2]["page"]!=User.item_list[2]["reading"]+20:
		User.item_list[2]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(10)
		User.mod_ability(User.item_list[2]["ability"])
func read4():
	if User.item_list[3]["page"]!=User.item_list[3]["reading"]+20:
		User.item_list[3]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(-10)
	if User.item_list[3]["page"]!=User.item_list[3]["reading"]+20:
		User.item_list[3]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(10)
		User.mod_ability(User.item_list[3]["ability"])
func read5():
	if User.item_list[4]["page"]!=User.item_list[4]["reading"]+20:
		User.item_list[4]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(-10)
	if User.item_list[4]["page"]!=User.item_list[4]["reading"]+20:
		User.item_list[4]["reading"]+=20
		User.mod_health(-5)
		User.mod_san(10)
		User.mod_ability(User.item_list[4]["ability"])
