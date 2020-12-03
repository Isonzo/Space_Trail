extends Control


func _on_Button_mouse_entered() -> void:
	$VBoxContainer/Description.text = "An efficient ship that requires less fuel, but has lower capacity and bulkiness."
	
func _on_Scout_mouse_exited() -> void:
	$VBoxContainer/Description.text =""
func _on_Scout_pressed() -> void:
	ShipInformation.ship_type =  "scout"
	get_tree().change_scene("res://Screens/Main Menu.tscn")


func _on_Freight_mouse_entered() -> void:
	$VBoxContainer/Description.text = "A tanky ship designed for transporting huge amounts of cargo. Not particularly fuel efficient."

func _on_Freight_mouse_exited() -> void:
	$VBoxContainer/Description.text =""



