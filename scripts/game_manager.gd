extends Node

var lives = 1
var score = 0
var life_cost = 100
var picked_fruits = {}

signal score_updated
signal lives_updated
signal player_died
signal game_over
signal finish_reached(door_type)
signal player_bounced


func add_point():
	score += 1
	score_updated.emit()

func update_score(value):
	score = score - value
	score_updated.emit()

func clear_points():
	score = 0
	score_updated.emit()

func add_life():
	lives += 1
	lives_updated.emit()

func reduce_life():
	lives -= 1
	lives_updated.emit()
	if lives <= 0:
		game_over.emit()
	else:
		player_died.emit()

func convert_coins_to_life():
	if score - life_cost >= 0:
		update_score(life_cost)
		add_life()

func reset_values():
	score = 0
	lives = 1
	picked_fruits.clear()

func pick_fruit(id):
	picked_fruits[id] = true
	add_life()
