extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.003

@onready var head = $PlayerHead
@onready var camera = $PlayerHead/Camera3D
@onready var raycast = $PlayerHead/Camera3D/RayCast3D
@onready var puzzle = $".."
@onready var prompt_ui = $CanvasLayer/InteractionPrompt
@onready var dog = $"."

var can_move : bool = true
var current_target : Node = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event: InputEvent) -> void:
	if not can_move:
		return
		
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	if not can_move:
		return

	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump -- ELIMINAR ESTO, NO HACE FALTA QUE SALTE.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Handle movement
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()

func _process(_delta: float) -> void:
	_update_interaction_prompt()

	if Input.is_action_just_pressed("interact"):
		_check_for_interaction()

func _check_for_interaction():
	if not raycast.is_colliding():
		return

	var collider = raycast.get_collider()
	if collider:
		# Orange cube
		if collider.is_in_group("Caja Naranja"):
			#collider.interact_naranja()
			collider.interact_orange_dialog()

		# Purple cube
		elif collider.is_in_group("Caja Violeta"):
			#collider.interact_violeta()
			collider.interact_purple_dialog()
			
		# Bed (sleep interaction)
		elif collider.is_in_group("Bed"):
			collider.interact()
			
		#Wet Dog
		elif collider.is_in_group("Dog"):
			collider.interact_dog()

func _update_interaction_prompt():
	raycast.force_raycast_update()
	var col = raycast.get_collider()

	if col and (col.is_in_group("Bed") or col.is_in_group("Dog")):
		# Show the floating label only once when targeting
		if current_target != col:
			current_target = col
			_show_label_above_object(col)
	else:
		# Hide the previous label when not looking
		if current_target and (current_target.is_in_group("Bed") or current_target.is_in_group("Dog")):
			_hide_label_above_object(current_target)
		current_target = null


func _show_label_above_object(object: Node) -> void:
	var label := object.get_node_or_null("Label3D")
	if label:
		label.visible = true
		label.modulate.a = 1.0

func _hide_label_above_object(object: Node) -> void:
	var label := object.get_node_or_null("Label3D")
	if label:
		label.visible = false

func _hide_all_labels():
	for node in get_tree().get_nodes_in_group("Interactable"):
		_hide_label_above_object(node)
