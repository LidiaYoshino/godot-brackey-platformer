extends AnimatableBody2D

@export_enum("grass", "sand", "pumpkin", "ice") var platform_type: String = "grass"

@onready var animated_sprite_2d = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.animation = platform_type


