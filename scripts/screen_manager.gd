extends Node2D

const LEVEL_01 = preload("res://scenes/Levels/level01.tscn")

@onready var game = $"."
@onready var title_screen = $"Title Screen"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("confirm"):
		print('enter')
		title_screen.visible = false
		var level = LEVEL_01.instantiate()
		game.add_child(level)
		print('done')
