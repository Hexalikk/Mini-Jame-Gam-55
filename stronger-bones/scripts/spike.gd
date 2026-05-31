extends Area2D

@onready var sprite = $AnimatedSprite2D
func _ready():
	sprite.play("new_animation")


func _on_body_entered(body: Node2D) -> void:
	var p : player = body as player
	if body.has_method("grow"):
		p.respawn()
