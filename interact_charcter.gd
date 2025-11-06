extends StaticBody3D

@export var texture_normal : Texture2D
@export var texture_clicked : Texture2D
@export var flashtime: float = 0.3

@onready var mesh_n: MeshInstance3D = $"Billboard Naranja"
@onready var mesh_v: MeshInstance3D = $"Billboard Violeta"

@onready var spawn_area: Area3D = $"../SpawnArea"
@onready var wet_dog: StaticBody3D = $"../Wet_Dog"
@onready var wet_dog_sprite: AnimatedSprite3D = $"../Wet_Dog/Sprite3D"
@onready var wet_dog_label: Label3D = $"../Wet_Dog/Label3D"
@onready var player = $"../Player"
@onready var puzzle_car: Node3D = get_node(".")
@onready var car: StaticBody3D = $"Car/Car Body/StaticBody3D"
@onready var car_alarm_sound: AudioStreamPlayer3D = $"../Alarm"
@onready var car_lock_sound: AudioStreamPlayer3D = $"../Lock"
@onready var puzzle_trafficlights: Node3D = $".."
@onready var trafficlight: StaticBody3D = $"."
@onready var puzzle_lampposts: Node3D = $".."
@onready var lamppost: StaticBody3D = $"."
@onready var puzzle_umbrella: Node3D = $".."
@onready var blue_umbrella: StaticBody3D = $BlueUmbrella
@onready var puzzle_chalk: Node3D = $".."

@onready var puzzle = $".."

var clicked: bool = false

func interact_naranja():
	if clicked:
		return
	_flash_texture_n()
	
func _flash_texture_n() -> void:
	clicked = true
	var material := mesh_n.get_active_material(0)
	if material and material is StandardMaterial3D:
		if clicked:
			material.albedo_texture = texture_clicked
			await get_tree().create_timer(flashtime).timeout
			material.albedo_texture = texture_normal
		clicked = false

func interact_violeta():
	if clicked:
		return
	_flash_texture_v()

func _flash_texture_v() -> void:
	clicked = true
	var material := mesh_v.get_active_material(0)
	if material and material is StandardMaterial3D:
		if clicked:
			material.albedo_texture = texture_clicked
			await get_tree().create_timer(flashtime).timeout
			material.albedo_texture = texture_normal
		clicked = false
		

@onready var dialog_box = get_tree().get_root().get_node("puzzle_police/Dialog Box")

var purple_dialog_options = ["Sigan andando sin cinturón, nomás...", "Todo esto por querer esquivar un perro."]
var orange_dialog_options = ["Esto pasa cuando salen borrachos de todos lados.", "Los jóvenes ya no tienen autocontrol, no hay nadie que les ponga un freno."]

func interact_purple_dialog():
	var random_index = randi() % purple_dialog_options.size()
	var chosen_dialog = purple_dialog_options[random_index] + " [R] - Continuar"
	if dialog_box and not dialog_box.is_showing:
		dialog_box.show_dialog(chosen_dialog)
	puzzle.talk_to_police()
		
func interact_orange_dialog():
	var random_index = randi() % orange_dialog_options.size()
	var chosen_dialog = orange_dialog_options[random_index] + " [R] - Continuar"
	if dialog_box and not dialog_box.is_showing:
		dialog_box.show_dialog(chosen_dialog)
	puzzle.talk_to_police()
	
func interact_dog():
	wet_dog_sprite.visible = false
	wet_dog_label.visible = false
	spawn_area.found_dog()
	var new_position = spawn_area.generate_random_position()
	if (not spawn_area.is_puzzle_wet_dog_solved()):
		wet_dog.position = new_position
		wet_dog_sprite.visible = true
		wet_dog_label.visible = true
		
func interact_car():
	print("Interactuando con auto")
	puzzle_car.stop_alarm()
	
func interact_trafficlight_one():
	print("Interactuando con semaforo 1")
	puzzle_trafficlights.switch_color_one()
	
func interact_trafficlight_two():
	print("Interactuando con semaforo 2")
	puzzle_trafficlights.switch_color_two()
	
func interact_lamppost_one():
	print("Interactuando con farol 1")
	puzzle_lampposts.switch_on_one()
	
func interact_blue_umbrella():
	print("Interactuando con el paraguas azul")
	puzzle_umbrella.solve()

func interact_chalk():
	print("Interactuando con la tiza")
	puzzle_chalk.inspect()
