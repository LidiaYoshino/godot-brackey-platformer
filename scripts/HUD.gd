extends CanvasLayer

@onready var coin_counter = $CoinLabel
@onready var fruit_counter = $FruitLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("score_updated", update_coin_counter)
	GameManager.connect("lives_updated", update_lives_counter)
	update_coin_counter()
	update_lives_counter()

func update_coin_counter():
	coin_counter.text = str(GameManager.score)

func update_lives_counter():
	fruit_counter.text = str(GameManager.lives)
	
