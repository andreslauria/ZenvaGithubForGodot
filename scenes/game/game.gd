extends Node2D

@onready var spawn_u: Marker2D = $SpawnU
@onready var spawn_d: Marker2D = $SpawnD
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_holder: Node = $PipesHolder

const PIPES = preload("res://scenes/pipes/pipes.tscn")


func _ready() -> void:
	ScoreManager.score = 0
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()


func _process(delta: float) -> void:
	pass


func spawn_pipes()-> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var yp: float = randf_range(spawn_u.position.y, spawn_d.position.y)
	new_pipes.position = Vector2(spawn_d.position.x, yp)
	pipes_holder.add_child(new_pipes)
	
	
	
#no hace  falta detenerlo aca, llamo a la signal desde el script de pipes y ahi los detengo, aprovechando el singleton
#func stop_pipes() -> void:
	#spawn_timer.stop()
	#for pipes in pipes_holder.get_children():
	#	pipes.set_process(false)



func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_died() -> void:
	spawn_timer.stop()
