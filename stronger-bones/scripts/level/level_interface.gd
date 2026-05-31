class_name level_interface extends Node


var level_id = -1
signal next_level

func end():
	next_level.emit()
	self.queue_free()


func set_level_id(id : int):
	level_id = id

func get_level_id():
	return level_id
