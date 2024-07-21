extends CanvasLayer

@onready var coin_counter = $CoinLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("score_updated", update_coin_counter)
	update_coin_counter()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_coin_counter():
	coin_counter.text = str(GameManager.score)
