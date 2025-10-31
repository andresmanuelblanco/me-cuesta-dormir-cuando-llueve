extends Area3D

@onready var wet_dog :StaticBody3D = $"../Wet_Dog"
@onready var shape: BoxShape3D = $CollisionShape3D.shape
@onready var player = $"../Player"

var wet_dog_found: int = 0
var puzzle_dog_solved : bool #Esta resuelto o no?

func found_dog():
	wet_dog_found += 1
	
func is_puzzle_wet_dog_solved():
	if (wet_dog_found == 3):
		puzzle_dog_solved = true
	else:
		puzzle_dog_solved = false
	return puzzle_dog_solved

var position_list = [Vector3(33, -0.8, 7), Vector3(-19, -0.8, 9), Vector3(3, -0.8, 7), Vector3(-7, -0.8, 11), Vector3(-17, -0.8, 33), Vector3(-15, -0.8, -12)]

func generate_random_position():
	var random_index = randi() % position_list.size()
	var random_position = position_list[random_index]
	position_list.remove_at(random_index)
	return random_position
	
func _ready():
	wet_dog.position = generate_random_position()
	print("La escena esta cargada")
