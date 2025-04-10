extends Node2D

@export var is_active = false;
@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var timer: Timer = $Timer

var rng = RandomNumberGenerator.new()
var is_timer_active: bool = false

func _process(_delta):
	if is_active:
		particles.emitting = true
		if !is_timer_active:
			timer.start(1)
			is_timer_active = true

func set_timer() -> void:
	timer.start(rng.randf_range(1.0, 3.0))

func _on_timer_timeout() -> void:
	particles.gravity.x = rng.randf_range(2.0, 5.0)
	set_timer()
