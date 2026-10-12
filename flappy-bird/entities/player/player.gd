extends CharacterBody2D


const JUMP_VELOCITY = -500.0
const MAX_GRAVITY=1000

@onready var screen_height = get_viewport().get_visible_rect().size.y



func _physics_process(delta: float) -> void:
	# Add the gravity.
	apply_gravity(delta)
	# Handle jump.
	handle_jump()
	handle_boundaries()
	move_and_slide()

func apply_gravity(delta:float) -> void:
	velocity += get_gravity() * delta
	if velocity.y > MAX_GRAVITY:
		velocity.y = MAX_GRAVITY

func handle_jump() -> void:
	if Input.is_action_just_pressed("flap"):
		velocity.y = JUMP_VELOCITY
		
func handle_boundaries() -> void:
	#check top of screen.
	if position.y <0:
		position.y =0
		velocity=Vector2(0,0)
	
	#check bottom of screen
	if position.y > screen_height:
		position.y = screen_height
		velocity=Vector2(0,0)
