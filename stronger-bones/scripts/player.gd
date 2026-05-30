class_name player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const SKULL_JUMP_VELOCITY = -100.0


@onready var _head_hitbox : CollisionShape2D = $hitbox_head
@onready var _normal_hitbox : CollisionShape2D = $hitbox_normal
@onready var _nolegs_hitbox : CollisionShape2D = $hitbox_rectangle

var _state = STATE.NORMAL
var heldFrameCounter: int = 0
var isHeldEnough: bool = false

signal drop_a_bone
@onready var animated_sprite :AnimatedSprite2D= $AnimatedSprite2D


enum STATE {
	NORMAL,
	NO_LEGS,
	HEAD
}

func _ready() -> void:
	_normal_hitbox.disabled = false
	_nolegs_hitbox.disabled = true
	_head_hitbox.disabled = true

func update_player():
	match _state:
		STATE.NORMAL:
			_normal_hitbox.disabled = false
			_nolegs_hitbox.disabled = true
			_head_hitbox.disabled = true
		STATE.NO_LEGS:
			_normal_hitbox.disabled = true
			_nolegs_hitbox.disabled = false
			_head_hitbox.disabled = true
		STATE.HEAD:
			_normal_hitbox.disabled = true
			_nolegs_hitbox.disabled = true
			_head_hitbox.disabled = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		heldFrameCounter += 1
		if heldFrameCounter > 50:
			heldFrameCounter = 51
			isHeldEnough = true
		
	if Input.is_action_just_released("jump") and is_on_floor():
		if isHeldEnough == true && _state == STATE.NORMAL :
			velocity.y += JUMP_VELOCITY*2
			isHeldEnough = false
			heldFrameCounter = 0
			print("long jump")

		elif _state != STATE.HEAD:
			isHeldEnough = false
			heldFrameCounter = 0
			velocity.y += JUMP_VELOCITY
		else:
			velocity.y += SKULL_JUMP_VELOCITY

	if Input.is_action_just_released("throw a bone"):
		match(_state):
			STATE.NORMAL:
				_state = STATE.NO_LEGS
			STATE.NO_LEGS:
				_state = STATE.HEAD
			STATE.HEAD:
				print("ptit easter egg la")

			
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = 1
	else:
		animated_sprite.flip_h = 0
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animations()
	update_player()
	move_and_slide()
	
func update_animations() -> void:
	
	if not is_on_floor() and velocity.y < 0:
		if _state != STATE.HEAD:
			animated_sprite.play("jump_left")
			
	elif is_on_floor() and velocity.x == 0 and not Input.is_action_pressed("jump"):
		if _state == STATE.NORMAL:
			animated_sprite.play("default")
		elif _state == STATE.NO_LEGS:
			animated_sprite.play("throw_legs")
		elif _state == STATE.HEAD:
			animated_sprite.play("throw_body")
			
