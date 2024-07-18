extends Node

var score = 0

@onready var label = $CanvasLayer/Label

func add_point():
	score += 1
	label.text = str(score)
