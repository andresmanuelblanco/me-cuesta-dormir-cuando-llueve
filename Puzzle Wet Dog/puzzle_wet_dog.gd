extends Area3D

@onready var wet_dog :StaticBody3D = $"../Wet_Dog"
@onready var shape: BoxShape3D = $CollisionShape3D.shape
#@onready var first_no_spawn_zone: CollisionShape3D = $"../NoSpawn1/CollisionShape3D"
#@onready var first_no_spawn_zone_shape: BoxShape3D = $"../NoSpawn1/CollisionShape3D".shape
#@onready var second_no_spawn_zone: CollisionShape3D = $"../NoSpawn2/CollisionShape3D"
#@onready var second_no_spawn_zone_shape: BoxShape3D = $"../NoSpawn2/CollisionShape3D".shape
#@onready var third_no_spawn_zone: CollisionShape3D = $"../NoSpawn3/CollisionShape3D"
#@onready var third_no_spawn_zone_shape: BoxShape3D = $"../NoSpawn3/CollisionShape3D".shape
#@onready var fourth_no_spawn_zone: CollisionShape3D = $"../NoSpawn4/CollisionShape3D"
#@onready var fourth_no_spawn_zone_shape: BoxShape3D = $"../NoSpawn4/CollisionShape3D".shape
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
	
	#var extents = shape.size / 2.0
	#var pos = Vector3(
		#randf_range(-extents.x, extents.x) + $CollisionShape3D.position.x,
		#-0.8,
		#randf_range(-extents.z, extents.z) + $CollisionShape3D.position.z
	#)
	#return pos
	
func _ready():
	wet_dog.position = generate_random_position()
	print("La escena esta cargada")

#func check_random_position(pos: Vector3):
	#var fsz = first_no_spawn_zone_shape.size / 2.0
	#var fsz_center_x = first_no_spawn_zone.position.x
	#var fsz_center_z = first_no_spawn_zone.position.z
	#
	#var ssz = second_no_spawn_zone_shape.size / 2.0
	#var ssz_center_x = second_no_spawn_zone.position.x
	#var ssz_center_z = second_no_spawn_zone.position.z
	#
	#var tsz = third_no_spawn_zone_shape.size / 2.0
	#var tsz_center_x = third_no_spawn_zone.position.x
	#var tsz_center_z = third_no_spawn_zone.position.z
	#
	#var fosz = fourth_no_spawn_zone_shape.size / 2.0
	#var fosz_center_x = fourth_no_spawn_zone.position.x
	#var fosz_center_z = fourth_no_spawn_zone.position.z
#
#
	## --- Zone 1
	#if ((pos.x > (fsz_center_x - fsz.x)) and (pos.x < (fsz_center_x + fsz.x))) or ((pos.z > (fsz_center_z - fsz.z)) and (pos.z < (fsz_center_z + fsz.z))):
		#print("NoSpawn1")
		#return false
#
	## --- Zone 2
	#elif ((pos.x > (ssz_center_x - ssz.x)) and (pos.x < (ssz_center_x + ssz.x))) or ((pos.z > (ssz_center_z - ssz.z)) and (pos.z < (ssz_center_z + ssz.z))):
		#print("NoSpawn2")
		#return false
#
	## --- Zone 3
	#elif ((pos.x > (tsz_center_x - tsz.x)) and (pos.x < (tsz_center_x + tsz.x))) or ((pos.z > (tsz_center_z - tsz.z)) and (pos.z < (tsz_center_z + tsz.z))):
		#print("NoSpawn3")
		#return false
	#
	##--- Zone 4
	#elif ((pos.x > (fosz_center_x - fosz.x)) and (pos.x < (fosz_center_x + fosz.x))) or ((pos.z > (fosz_center_z - fosz.z)) and (pos.z < (fosz_center_z + fosz.z))):
		#print("NoSpawn3")
		#return false
	#
	#else:	
		#print("Spawned")
		#return true
	
