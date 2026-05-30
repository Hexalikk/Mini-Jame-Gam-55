extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	var p : player = body as player
	if p._state != player.STATE.NORMAL:
		p.grow()
		self.queue_free()
