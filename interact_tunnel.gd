extends Area3D

@export var fade_layer_path: NodePath
@export var room: String #Habitacion

@onready var puzzle_police = $".."
@onready var puzzle_wet_dog = $"../SpawnArea"
@onready var fade_layer = get_node(fade_layer_path)

var next_puzzle: String

func get_next_puzzle():
	var list = Global.get_puzzle_list()
	next_puzzle = Global.random_new_puzzle(list)
	return next_puzzle

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		if body.is_in_group("Puzzle_Police"):
			start_transition_police()
		elif body.is_in_group("Puzzle_Wet_Dog"):
			start_transition_dog()
		#start_transition()

func start_transition_police() -> void:
	# Fade out
	await fade_layer.fade_out(1.0)
	# Decide where to go
	if (puzzle_police.is_puzzle_police_solved()):
		print("Éxito")
		get_next_puzzle()
		get_tree().change_scene_to_file(next_puzzle)
	else:
		print("Terrible pesadilla")
		Global.reset()
		get_tree().change_scene_to_file(room)
		
func start_transition_dog() -> void:
	# Fade out
	await fade_layer.fade_out(1.0)
	# Decide where to go
	if (puzzle_wet_dog.is_puzzle_wet_dog_solved()):
		print("Éxito")
		get_next_puzzle()
		get_tree().change_scene_to_file(next_puzzle)
	else:
		print("Terrible pesadilla")
		Global.reset()
		get_tree().change_scene_to_file(room)
