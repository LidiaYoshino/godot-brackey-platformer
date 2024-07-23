extends Area2D

@onready var timer = $Timer
@onready var audio_stream_player = $AudioStreamPlayer
@onready var level_container = %LevelContainer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	audio_stream_player.playing = true
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
	GameManager.clear_points()
	GameManager.reduce_life()
	# get_tree().reload_current_scene()
	# level_container.reload_current_scene()
