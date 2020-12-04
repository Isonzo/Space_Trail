extends Node2D


func _ready() -> void:
	
	pass

func _on_Button_toggled(button_pressed: bool) -> void:
	if (button_pressed):
		$Timer.start()
	else:
		$Timer.stop()


func _on_Timer_timeout() -> void:
	ShipInformation.daily_calculations()
	print("A day has passed")
	pass # Replace with function body.
