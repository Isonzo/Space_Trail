extends Node

const FOOD_RATE = 0.5
const OX_RATE = 1

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
var morale = 10

var starvation = 0


func init_ship_stats():
	hp = ships[ship_type][0]
	fuel = ships[ship_type][1]
	fuel_rate = ships[ship_type][2]
	food = ships[ship_type][3]
	oxygen = ships[ship_type][4]
	capacity = ships[ship_type][5]
	crew = ships[ship_type][6]

func daily_calculations():
	food_update()
	starvation_check()
	fuel_update()
	oxygen_check()
	
	
	
	
	
func food_update():
	food -= crew * FOOD_RATE
	if food < 0:
		food = 0
		starvation += 1
	else:
		starvation -= 0.25

func starvation_check():
	if starvation > 15 and food == 0:
		randomize()
		var death_roll = randi() % int(round(starvation))
		if death_roll > 14:
			crew -= 1

func fuel_update():
	fuel -= fuel_rate

func oxygen_check():
	if oxygen < 100:
		oxygen += OX_RATE
	else:
		oxygen = 100


