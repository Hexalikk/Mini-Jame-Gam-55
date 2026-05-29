class_name player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const SKULL_JUMP_VELOCITY = -100.0

var _state = STATE.NORMAL

var heldFrameCounter: int = 0
var isHeldEnough: bool = false


signal drop_a_bone


enum STATE {
	NORMAL,
	NO_LEGS,
	HEAD
}

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
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
