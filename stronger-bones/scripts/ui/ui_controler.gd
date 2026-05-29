extends Node


@onready var _main_menu = $MainMenu


func _ready() -> void:
	_main_menu.show()

func _on_main_menu_select_level() -> void:
	_main_menu.hide()
