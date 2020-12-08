extends Node

const FOOD_RATE = 0.5

# A ships stats in order: HP, Fuel, Fuel use rate, Food, Oxygen %, Capacity, Crew
var ships = {
			"scout" : [10, 20.0, 1.0, 20.0, 100.0, 60, 3],
			"freight" : [25, 60.0, 1.2, 50.0, 100.0, 160, 4]
				 }

var ship_type = "scout"

var hp = ships[ship_type][0]
var fuel = ships[ship_type][1]
var fuel_rate = ships[ship_type][2]
var food = ships[ship_type][3]
var oxygen = ships[ship_type][4]
var capacity = ships[ship_type][5]
var crew = ships[ship_type][6]

var moving = false

func init_ship_stats():
	hp = ships[ship_type][0]
	fuel = ships[ship_type][1]
	fuel_rate = ships[ship_type][2]
	food = ships[ship_type][3]
	oxygen = ships[ship_type][4]
	capacity = ships[ship_type][5]
	crew = ships[ship_type][6]

func daily_calculations():
	food -= crew * FOOD_RATE
	
	fuel -= fuel_rate
	
	if oxygen < 100:
		oxygen += FOOD_RATE
	else:
		oxygen = 100
	
	
