extends Node3D

@onready var sprite_one= $"TrafficLight 1 Red/Sprite3D"
@onready var light_one = $"TrafficLight 1 Red/LuzFarol1"

@onready var sprite_two = $"TrafficLight 2 Red/Sprite3D"
@onready var light_two = $"TrafficLight 2 Red/LuzFarol1"

@onready var sprite_sinistro = $Siniestro
@export var move_distance: float = 23.0   # How far to move in +X
@export var move_duration: float = 1.0   # How long the movement takes (seconds)
#@export var target_scale: Vector3 = Vector3(2, 2, 2)  # Final scale

var green_trafficlight_one: bool = false
var green_trafficlight_two: bool = false
var puzzle_trafficlights_solved : bool = false

func _ready() -> void:
	pass # Replace with function body.

func is_puzzle_trafficlights_solved():
	if (green_trafficlight_one == true and green_trafficlight_two == true):
		puzzle_trafficlights_solved = true

func switch_color_one():
	var texture = load("res://Puzzle Trafficlights/ARTE 2D/IMG_5296.PNG")
	if texture:
		sprite_one.texture = texture
	light_one.light_color = "1cbf66"
	green_trafficlight_one = true
	
func switch_color_two():
	var texture = load("res://Puzzle Trafficlights/ARTE 2D/IMG_5296.PNG")
	if texture:
		sprite_two.texture = texture
	light_two.light_color = "1cbf66"
	green_trafficlight_two = true

func jumpscare():
	var tween = create_tween()
	# Target position in +X direction
	var target_position = sprite_sinistro.position + Vector3(move_distance, 0, 0)
	# Animate position
	tween.tween_property(sprite_sinistro, "position", target_position, move_duration)

	# Animate scale simultaneously
	#tween.parallel().tween_property(sprite_sinistro, "scale", target_scale, move_duration)
