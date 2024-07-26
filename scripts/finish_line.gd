extends Area2D

@export_enum("grass", "sand", "pumpkin", "ice", "home") var door_type: String = "grass"

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(str(door_type))
	animated_sprite_2d.animation = door_type

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func finish_line():
	GameManager.finish_reached.emit()


func _on_body_entered(body):
	animation_player.play('finish')
