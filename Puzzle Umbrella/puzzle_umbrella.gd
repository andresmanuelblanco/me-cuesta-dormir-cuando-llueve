extends Node3D

@onready var sprite_sinistro = $Siniestro
@export var move_distance: float = 23.0   # How far to move in +X
@export var move_duration: float = 1.0   # How long the movement takes (seconds)
#@export var target_scale: Vector3 = Vector3(2, 2, 2)  # Final scale

var blue_umbrella_interacted: bool = false
var puzzle_umbrella_solved : bool = false

func _ready() -> void:
	pass # Replace with function body.

func solve():
	print("Resuelto!")
	blue_umbrella_interacted = true

func is_puzzle_umbrella_solved():
	if (blue_umbrella_interacted == true):
		puzzle_umbrella_solved = true
		return true

func jumpscare():
	var tween = create_tween()
	# Target position in +X direction
	var target_position = sprite_sinistro.position + Vector3(move_distance, 0, 0)
	# Animate position
	tween.tween_property(sprite_sinistro, "position", target_position, move_duration)

	# Animate scale simultaneously
	#tween.parallel().tween_property(sprite_sinistro, "scale", target_scale, move_duration)
	
