extends Node2D


func _ready() -> void:
	ShipInformation.init_ship_stats()
	
	pass

func _process(_delta: float) -> void:
	$Popup.show()
