extends Node2D


signal end_the_game



func _on_area_2d_area_entered(area: Area2D) -> void:
	end_the_game.emit()
