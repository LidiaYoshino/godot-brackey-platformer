extends Node

var score = 0
signal score_updated

func add_point():
	score += 1
	score_updated.emit()

func clear_points():
	score = 0
	score_updated.emit()
