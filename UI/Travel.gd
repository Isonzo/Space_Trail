extends Node2D

onready var JumpPoints = $JumpPoints.get_children()

var player_moving = false

export var SPEED = 10

func _ready() -> void:
#	#Connect JumpPoints
	for jump_point in JumpPoints:
		jump_point.connect("in_range", self, "_when_in_range")
	$TravelPoint.connect("destination_reached", self, "_when_destination_reached")
	
func _process(_delta: float) -> void:
	check_for_end()
	input_check()
	timer_text_update()

func timer_text_update():
	if $Timer.is_stopped():
		$Button.text = "travel"
	else:
		$Button.text = "Stop"

func input_check():
	if Input.is_action_just_pressed("travel"):
		travel_point_update()

func _on_Button_toggled(button_pressed: bool) -> void:
	if (button_pressed):
		player_moving = true
		$Timer.start()

		
	else:
		$Timer.stop()
		player_moving = false
		$Player.move_and_slide(Vector2.ZERO)

#Basically the ticks of the game
func _on_Timer_timeout() -> void:
	ShipInformation.daily_calculations()
	print("A day has passed")
	var direction = direction_to_point()
	if player_moving and ShipInformation.fuel > 0:
		$Player.move_and_slide(direction * SPEED)
	else:
		$Timer.stop()

func direction_to_point():
	var direction = $Player.position.direction_to($TravelPoint.position)
	return direction
func distance_to_point():
	var distance = $Player.position.distance_to($TravelPoint.position)
	return distance
	

func _when_in_range():
	print("Signal Worked!")

func _when_destination_reached():
	$Timer.stop()

func check_for_end():
	pass
	
func travel_point_update():
	$TravelPoint.position = get_local_mouse_position()
	
