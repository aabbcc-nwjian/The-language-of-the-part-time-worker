extends Control

func _ready() -> void:
	if (User.ending == 1):
		$Ending1.show()
	elif (User.ending == 2):
		$Ending2.show()
	elif (User.ending == 3):
		$Ending3.show()
	elif (User.ending == 4):
		$Ending4.show()
	elif (User.ending == 5):
		$Ending5.show()
	elif (User.ending == 6):
		$Ending6.show()
