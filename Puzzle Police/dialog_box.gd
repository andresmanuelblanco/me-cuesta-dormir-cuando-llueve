extends CanvasLayer

@onready var label = $"PanelContainer/MarginContainer/Text Label"

var is_showing := false

func _ready():
	visible = false

func show_dialog(text: String):
	get_tree().root.get_node("puzzle_police/Player").can_move = false
	visible = true
	is_showing = true
	label.text = ""
	await _type_text(text)
	await _wait_for_input()
	hide_dialog()

func hide_dialog():
	get_tree().root.get_node("puzzle_police/Player").can_move = true
	visible = false
	is_showing = false

# typewriter effect
func _type_text(text: String) -> void:
	for i in text.length():
		label.text += text[i]
		await get_tree().create_timer(0.03).timeout  # speed of typing

# wait for input before closing
func _wait_for_input() -> void:
	while true:
		await get_tree().process_frame
		if Input.is_action_just_pressed("ui_accept"):
			break
