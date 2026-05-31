extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	var p : player = body as player
	if body.has_method("grow"):
		$MilkDrinking.play()
		if p._state != player.STATE.NORMAL:
			p.grow()
			self.hide()
			$Area2D/CollisionShape2D.call_deferred("set_disabled",true)
