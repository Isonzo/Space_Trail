extends MarginContainer

onready var ship_type = $VBoxContainer/ShipType
onready var food = $VBoxContainer/HBoxContainer2/Food
onready var oxygen = $VBoxContainer/HBoxContainer2/Oxygen
onready var hp = $VBoxContainer/HBoxContainer/HP
onready var fuel = $VBoxContainer/HBoxContainer/Fuel
onready var crew = $VBoxContainer/Crew


func _process(delta: float) -> void:
	draw_ship_stats()

func draw_ship_stats():
	ship_type.text = "Ship : " + ShipInformation.ship_type
	food.text = "Food : " + str(ShipInformation.food)
	hp.text = "HP : " + str(ShipInformation.hp)
	oxygen.text = "Oxygen : " + str(ShipInformation.oxygen)
	crew.text = "Crew : " + str(ShipInformation.crew)
