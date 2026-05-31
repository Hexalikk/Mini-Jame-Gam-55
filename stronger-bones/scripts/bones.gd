class_name Bones extends RigidBody2D


enum TYPE{
	LEGS,
	TORSO
}
const LEGS_TEXTURE  = preload("res://assets/bone_legs.png")
const TORSO_TEXTURE = preload("res://assets/bone_torso.png")

@onready var torso_hitbox = $torso_hitbox
@onready var leg_hitbox = $leg_hitbox
@onready var sprite = $Sprite2D

var _state = TYPE.LEGS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	torso_hitbox.disabled = true
	sprite.texture = LEGS_TEXTURE



func set_type(type):
	match type:
		TYPE.LEGS:
			_state = TYPE.LEGS
			leg_hitbox.disabled = false
			torso_hitbox.disabled = true
			sprite.texture = LEGS_TEXTURE
		TYPE.TORSO:
			_state = TYPE.TORSO
			leg_hitbox.disabled = true
			torso_hitbox.disabled = false
			sprite.texture = TORSO_TEXTURE
			
		

	
