extends Node

var lives = 1
var score = 0
signal score_updated
signal lives_updated


func add_point():
	score += 1
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
