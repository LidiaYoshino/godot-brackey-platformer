extends Area2D

@export var id = ''
@onready var animation_player = $AnimationPlayer

func _ready():
	if GameManager.picked_fruits.has(id):
		queue_free()

func _on_body_entered(_body):
	GameManager.pick_fruit(id)
	animation_player.play("pickup")
