extends StaticBody3D

@export var prompt_text: String = "Sleep"
@export var fade_layer_path : NodePath

var new_scene_path : String = Global.random_new_puzzle(Global.puzzle_list)

@onready var fade_layer = get_node(fade_layer_path)

func start_transition() -> void:
	# Fade out
	await fade_layer.fade_out(1.0)
	print("Posible crash 1")
	get_tree().change_scene_to_file(new_scene_path)
	print("Posible crash 2")

func interact():
	start_transition()
