extends Control


@onready var music = $PanelContainer/VBoxContainer/Music
@onready var sfx = $"PanelContainer/VBoxContainer/Sound effects"

func _on_windowed_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_fullscreen_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_returntomenu_pressed() -> void:
	self.hide()

func _on_sound_effects_value_changed(value: float) -> void:
	var sfx_index= AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(sfx_index, value)
	if value == -40:
		AudioServer.set_bus_mute(sfx_index,true)
	else:
		AudioServer.set_bus_mute(sfx_index,false)

func _on_music_value_changed(value: float) -> void:
	var sfx_index= AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(sfx_index, value)
	if value == -40:
		AudioServer.set_bus_mute(sfx_index,true)
	else:
		AudioServer.set_bus_mute(sfx_index,false)
