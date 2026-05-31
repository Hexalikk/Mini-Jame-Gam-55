class_name level1 extends level_interface
@onready var pause = $PauseMenu
@onready var player_camera = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_level_id(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		pause.show()
		get_tree().paused = true
		


func _on_necromancer_end_the_game() -> void:
	end()
