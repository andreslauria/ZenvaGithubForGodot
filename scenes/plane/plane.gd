extends CharacterBody2D

class_name Tappy

#ANULADO por que se pasa al singleton signal_manager
# signal on_plane_died #senial emitida cuando el avion muera..va dentro de la funcion die() 


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound


const GRAVITY: float = 1000
const POWER: float  = -350


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor() or is_on_ceiling():
		die()
	
func fly() -> void:
	if Input.is_action_just_pressed("Fly"):
		animation_player.play("power")
		velocity.y = POWER


func die()-> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
	sound.stop()
	#traigo la signal desde el singleton
	SignalManager.on_plane_died.emit()
