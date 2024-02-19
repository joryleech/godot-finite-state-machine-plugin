extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var state_machine = $"Finite State Machine"


func _physics_process(delta):
	# Handle jump.
	if(is_on_floor()):
		state_machine.set_variable_float("jump_time", -0.1)
		velocity.y = 0
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			state_machine.set_variable_float("jump_time", 1)
	else:
		velocity.y += get_gravity().y * delta



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	state_machine.set_variable_float("walk_magnitude", abs(direction))
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
