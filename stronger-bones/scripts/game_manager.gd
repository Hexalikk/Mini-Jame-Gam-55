extends Node

var _current_level = -1

var level_1 =preload("res://scenes/levels/Level1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_level(id :int):
	var level
	match id:
		1:
			level = level_1.instantiate()
	if level != null:
		get_node(".").add_child(level)

func _on_ui_controler_load_level() -> void:
	load_level(1)
