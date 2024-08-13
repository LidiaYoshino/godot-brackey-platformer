extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

func _ready():
	GameManager.connect("player_bounced", bounce)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.playing = true
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0 and GameManager.allow_movement == true:
		animated_sprite.flip_h = false
	elif direction < 0 and GameManager.allow_movement == true:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		elif GameManager.allow_movement == true:
			animated_sprite.play("run")
	else: animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if GameManager.allow_movement == true:
		move_and_slide()
	else:
		if not is_on_floor():
			move_and_slide()
	
	
func bounce():
	velocity.y = JUMP_VELOCITY
