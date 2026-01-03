extends Control

@onready var highscore_label: Label = $MarginContainer/HighscoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highscore_label.text = str(ScoreManager._high_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fly"):
		GameManager.load_game_scene()
