extends Node2D

signal destination_reached




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		emit_signal("destination_reached")
