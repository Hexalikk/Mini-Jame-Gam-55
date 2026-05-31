extends Node2D

signal plate_pressed
signal plate_released

var pressed: int = 0

@onready var animated_sprite = $AnimatedSprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("test")
	if body is Bones or body is player:
		pressed += 1
		animated_sprite.play("pressed")
		plate_pressed.emit()
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	print("test2")
	if body is Bones or body is player:
		pressed -= 1
		if pressed == 0:
			plate_released.emit()
			animated_sprite.play("default")


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
