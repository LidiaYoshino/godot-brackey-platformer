extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	GameManager.add_life()
	animation_player.play("pickup")
