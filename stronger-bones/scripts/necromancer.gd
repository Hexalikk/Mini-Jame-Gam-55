extends Node2D


signal end_the_game
@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	sprite.play("default")


	


func _on_area_2d_body_entered(body: Node2D) -> void:
	end_the_game.emit()
