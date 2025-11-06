extends Area3D

@export var fade_layer_path: NodePath
@export var room: String #Habitacion

@onready var puzzle_police = $".."
@onready var puzzle_wet_dog = $"../SpawnArea"
@onready var puzzle_car = $".."
@onready var puzzle_trafficlights = $".."
@onready var puzzle_umbrella: Node3D = $".."
@onready var puzzle_chalk: Node3D = $".."
@onready var player = $"../Player"

@onready var fade_layer = get_node(fade_layer_path)

var next_puzzle: String

func get_next_puzzle():
	var list = Global.get_puzzle_list()
	next_puzzle = Global.random_new_puzzle(list)
	return next_puzzle

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		if body.is_in_group("Puzzle_Police"):
			start_transition_police()
		elif body.is_in_group("Puzzle_Wet_Dog"):
			start_transition_dog()
		elif body.is_in_group("Puzzle_Car"):
			start_transition_car()
		elif body.is_in_group("Puzzle_Trafficlights"):
			if (!puzzle_trafficlights.is_puzzle_trafficlights_solved()):
				player.can_move = false
				print(player.position)
				puzzle_trafficlights.jumpscare()
			await get_tree().create_timer(0.75).timeout
			start_transition_trafficlights()
		elif body.is_in_group("Puzzle_Umbrella"):
			print(get_parent().is_puzzle_umbrella_solved())
			if (!get_parent().is_puzzle_umbrella_solved()):
				player.can_move = false
				print(player.position)
				puzzle_umbrella.jumpscare()
			await get_tree().create_timer(0.75).timeout
			start_transition_umbrella()
		elif body.is_in_group("Puzzle_Chalk"):
			print(puzzle_chalk.is_puzzle_chalk_solved())
			if (!puzzle_chalk.is_puzzle_chalk_solved()):
				player.can_move = false
				print(player.position)
				puzzle_chalk.jumpscare()
			await get_tree().create_timer(0.75).timeout
			start_transition_chalk()

func start_transition_police():
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
		
func start_transition_dog():
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
		
func start_transition_car():
	# Fade out
	await fade_layer.fade_out(1.0)
	# Decide where to go
	if (puzzle_car.is_puzzle_car_solved()):
		print("Éxito")
		get_next_puzzle()
		get_tree().change_scene_to_file(next_puzzle)
	else:
		print("Terrible pesadilla")
		Global.reset()
		get_tree().change_scene_to_file(room)
		
func start_transition_trafficlights():
	# Fade out
	await fade_layer.fade_out(1.0)
	# Decide where to go
	if (puzzle_trafficlights.is_puzzle_trafficlights_solved()):
		print("Éxito")
		get_next_puzzle()
		get_tree().change_scene_to_file(next_puzzle)
	else:
		print("Terrible pesadilla")
		Global.reset()
		get_tree().change_scene_to_file(room)
		
func start_transition_umbrella():
	# Fade out
	await fade_layer.fade_out(1.0)
	# Decide where to go
	if (puzzle_umbrella.is_puzzle_umbrella_solved()):
		print("Éxito")
		get_next_puzzle()
		get_tree().change_scene_to_file(next_puzzle)
	else:
		print("Terrible pesadilla")
		Global.reset()
		get_tree().change_scene_to_file(room)
		
func start_transition_chalk():
	# Fade out
	await fade_layer.fade_out(1.0)
	# Decide where to go
	if (puzzle_chalk.is_puzzle_chalk_solved()):
		print("Éxito")
		get_next_puzzle()
		get_tree().change_scene_to_file(next_puzzle)
	else:
		print("Terrible pesadilla")
		Global.reset()
		get_tree().change_scene_to_file(room)
