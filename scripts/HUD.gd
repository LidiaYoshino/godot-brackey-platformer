extends CanvasLayer

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("score_updated", update_coin_counter)
	update_coin_counter()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_coin_counter():
	label.text = str(GameManager.score)
