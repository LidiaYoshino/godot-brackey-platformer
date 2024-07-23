extends Node2D

const LEVEL_01 = preload("res://scenes/Levels/level01.tscn")
const GAME_OVER = preload("res://scenes/game_over.tscn")
const VICTORY = preload("res://scenes/victory.tscn")

@onready var title_screen = $"Title Screen"
@onready var level_container = $LevelContainer


func _ready():
	GameManager.connect('player_died', reload_level)
	GameManager.connect('game_over', end_game)
	GameManager.connect('finish_reached', victory)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("confirm"):
		title_screen.visible = false
		load_current_level()

func load_current_level():
	var level = LEVEL_01.instantiate()
	level_container.add_child(level)

func reload_level():
	level_container.get_child(0).queue_free()
	load_current_level()

func end_game():
	level_container.get_child(0).queue_free()
	add_child(GAME_OVER.instantiate())
	
func victory():
	level_container.get_child(0).queue_free()
	add_child(VICTORY.instantiate())
