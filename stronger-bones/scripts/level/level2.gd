class_name level2 extends level_interface

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_level_id(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_necromancer_end_the_game() -> void:
	end()
