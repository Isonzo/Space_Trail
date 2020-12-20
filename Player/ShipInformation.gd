extends Node

const FOOD_RATE = 0.5
const OX_RATE = 1

# A ships stats in order: HP, Fuel, Fuel use rate, Food, Oxygen %, Capacity, Crew
var ships = {
	"scout":{
		"hp": 10,
		"fuel": 20.0,
		"fuel_rate": 1.0,
		"food": 20.0,
		"capacity": 60,
		"crew": 3
		},
	"freight":{
		"hp": 25,
		"fuel": 60.0,
		"fuel_rate": 1.2,
		"food": 50.0,
		"capacity": 160,
		"crew": 4
		}

	 }

var ship_type = "scout"

var hp = ships[ship_type]["hp"]
var fuel = ships[ship_type]["fuel"]
var fuel_rate = ships[ship_type]["fuel_rate"]
var food = ships[ship_type]["food"]
var oxygen = 100.0
var capacity = ships[ship_type]["capacity"]
var crew = ships[ship_type]["crew"]
var morale = 10

var starvation = 0


func init_ship_stats():
	var hp = ships[ship_type]["hp"]
	var fuel = ships[ship_type]["fuel"]
	var fuel_rate = ships[ship_type]["fuel_rate"]
	var food = ships[ship_type]["food"]
	var capacity = ships[ship_type]["capacity"]
	var crew = ships[ship_type]["crew"]

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


