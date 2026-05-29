extends Control


#@onready var _button_play = $VBoxContainer/Play
#@onready var _button_option = $VBoxContainer/Option
#@onready var _button_exit = $VBoxContainer/Exit
@onready var _settings = $Settings
signal select_level

func _on_play_pressed() -> void:
	select_level.emit()


func _on_option_pressed() -> void:
	_settings.show()


func _on_exit_pressed() -> void:
	get_tree().quit()
