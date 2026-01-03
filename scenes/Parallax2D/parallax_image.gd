extends Parallax2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@export var texture: Texture2D


func _ready() -> void:
	SignalManager.on_plane_died.connect(_on_plane_died)
	var scale_f = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture  = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	repeat_size.x = texture.get_width() * scale_f


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_plane_died() -> void:
	set_process_internal(false)  #manejo el process interno al nodo, no la funcion _process. por eso puedo para el autoscroll!
