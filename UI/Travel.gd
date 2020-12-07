extends Node2D

onready var JumpPoints = $JumpPoints.get_children()

var player_moving = false

export var SPEED = 10

func _ready() -> void:
	$JumpPoints.get_children()[0].connect("in_range", self, "_when_in_range")
	print(JumpPoints)
	pass
	
func _process(delta: float) -> void:
#	var direction = direction_to_point()
#	if player_moving:
#		$Player.move_and_slide(direction * SPEED)
#	else:
#		$Player.move_and_slide(Vector2.ZERO)
	pass


func _on_Button_toggled(button_pressed: bool) -> void:
	if (button_pressed):
		player_moving = true
		$Timer.start()

		
	else:
		$Timer.stop()
		player_moving = false
		$Player.move_and_slide(Vector2.ZERO)


func _on_Timer_timeout() -> void:
	ShipInformation.daily_calculations()
	print("A day has passed")
	var direction = direction_to_point()
	if player_moving:
		$Player.move_and_slide(direction * SPEED)
	pass # Replace with function body.

func direction_to_point():
	var direction = $Player.position.direction_to(JumpPoints[0].position)
	return direction
func distance_to_point():
	var distance = $Player.position.distance_to(JumpPoints[0].position)
	return distance
	

func _when_in_range():
	print("Signal Worked!")
	JumpPoints.pop_front()
