extends Node2D


signal in_range

func _ready() -> void:
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		emit_signal("in_range")
