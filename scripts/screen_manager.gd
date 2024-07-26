extends Node2D

const LEVEL_01 = preload("res://scenes/Levels/level01.tscn")
const LEVEL_02 = preload("res://scenes/Levels/level02.tscn")
const GAME_OVER = preload("res://scenes/game_over.tscn")
const VICTORY = preload("res://scenes/victory.tscn")

const LEVEL_BY_TYPE = {
	"bare": LEVEL_01,
	"grass": LEVEL_02,
	"sand": LEVEL_01,
	"pumpkin": LEVEL_01,
	"ice": LEVEL_01,
	"home": LEVEL_01,
}

@onready var title_screen = $"Title Screen"
@onready var level_container = $LevelContainer

var current_level = "bare"

func _ready():
	GameManager.connect('player_died', reload_level)
	GameManager.connect('game_over', end_game)
	GameManager.connect('finish_reached', finish_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("confirm"):
		title_screen.visible = false
		load_current_level()

func load_current_level():
	level_container.add_child(LEVEL_BY_TYPE[current_level].instantiate())

func reload_level():
	level_container.get_child(0).queue_free()
	load_current_level()

func end_game():
	level_container.get_child(0).queue_free()
	add_child(GAME_OVER.instantiate())
	
func finish_level(door_type):
	current_level = door_type
	level_container.get_child(0).queue_free()
	load_current_level()

