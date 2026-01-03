extends Control

@onready var space_label: Label = $SpaceLabel
@onready var gameover_label: Label = $GameoverLabel
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer = $Sound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fly") and space_label.visible:
		GameManager.load_main_scene()


func on_plane_died()->void:
	show()
	timer.start()
	sound.play()
	ScoreManager.save_to_file()

func _on_timer_timeout() -> void:
	gameover_label.hide()
	space_label.show()
