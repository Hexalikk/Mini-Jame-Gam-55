extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var p : player = body as player
	if body.has_method("grow"):
		p.last_checkpoint = self.global_position
