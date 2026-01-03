extends Node

const SCORES_PATH = "user://highscore.dat"

var score: int = 0:
	get:
		return score
	set(v):
		score = v
		if score > _high_score:
			_high_score = score
		SignalManager.on_score_updated.emit()


var _high_score: int = 0:
	get:
		return _high_score


func _ready() -> void:
	load_from_file()

func increment_score() -> void:
	score += 1


func save_to_file() -> void:
	var file = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	if file:
		file.store_32(_high_score)
		file.close()

func load_from_file() -> void:
	var file = FileAccess.open(SCORES_PATH, FileAccess.READ)
	if file:
		if file.get_length() >0:
			_high_score = file.get_32()
	file.close()
