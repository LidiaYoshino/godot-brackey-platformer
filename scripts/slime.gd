extends Node2D

const SPEED = 60

@export var moving = false

var direction = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_down = $RayCastDown
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		move(delta)

func _physics_process(delta):	
	if ray_cast_down.is_colliding() == false:
		print('falling')
		position.y += gravity * delta
	
	
func move(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta


func _on_vulnerable_zone_body_entered(_body):
	moving = false
	GameManager.player_bounced.emit()
	animation_player.play("death")
	
