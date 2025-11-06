extends Node3D

@onready var sprite_one= $"LampPost 1/Sprite3D"
@onready var light_one = $"LampPost 1/LuzFarol1"

@onready var sprite_sinistro = $Siniestro
@export var move_distance: float = 23.0   # How far to move in +X
@export var move_duration: float = 1.0   # How long the movement takes (seconds)
#@export var target_scale: Vector3 = Vector3(2, 2, 2)  # Final scale

var lamppost_one_on: bool = false
var puzzle_lampposts_solved : bool = false

func _ready() -> void:
	pass # Replace with function body.

func is_puzzle_lamppostss_solved():
	if (lamppost_one_on == true):
		puzzle_lampposts_solved = true

func switch_on_one():
	var texture = load("res://Puzzle Lamppost/ARTE 2D/Hombre_Farol_Prendido.PNG")
	if texture:
		sprite_one.texture = texture
	light_one.visible = true

func jumpscare():
	var tween = create_tween()
	# Target position in +X direction
	var target_position = sprite_sinistro.position + Vector3(move_distance, 0, 0)
	# Animate position
	tween.tween_property(sprite_sinistro, "position", target_position, move_duration)

	# Animate scale simultaneously
	#tween.parallel().tween_property(sprite_sinistro, "scale", target_scale, move_duration)
	
