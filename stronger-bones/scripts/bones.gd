class_name Bones extends RigidBody2D


enum TYPE{
	LEGS,
	TORSO
}
const LEGS_TEXTURE  = preload("res://assets/milk.png")
const TORSO_TEXTURE = preload("res://assets/milk.png")

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
			if leg_hitbox != null:
				leg_hitbox.disabled = false
			if torso_hitbox != null:
				torso_hitbox.disabled = true
			if sprite != null:
				sprite.texture = LEGS_TEXTURE
		TYPE.TORSO:
			_state = TYPE.TORSO
			if leg_hitbox != null:
				leg_hitbox.disabled = true
			if torso_hitbox != null:
				torso_hitbox.disabled = false
			if sprite != null:
				sprite.texture = TORSO_TEXTURE
