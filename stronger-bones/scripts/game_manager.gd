extends Node

var _current_level = -1

var level_1 =preload("res://scenes/levels/Level1.tscn")
var level_2 = preload("res://scenes/levels/Level2.tscn")

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
			level  = level_1.instantiate() as level_interface
			_current_level = 1
		2:
			level = level_2.instantiate()  as level_interface
			_current_level = 2
	print(level)
	if level != null:
		get_node(".").add_child(level)
		level.next_level.connect(_switch_level)

func _on_ui_controler_load_level() -> void:
	load_level(1)

func _switch_level():
	load_level(_current_level+1)
