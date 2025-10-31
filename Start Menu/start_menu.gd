extends Node2D

@onready var arrow: Sprite2D = $Arrow

func _on_start_pressed() -> void:
	Global.game_start()
	get_tree().change_scene_to_file("res://room.tscn")


func _on_start_focus_entered() -> void:
	arrow.position = Vector2(60, 420)
	arrow.visible = true


func _on_start_mouse_entered() -> void:
	arrow.position = Vector2(60, 420)
	arrow.visible = true


func _on_start_focus_exited() -> void:
	arrow.visible = false


func _on_start_mouse_exited() -> void:
	arrow.visible = false


func _on_options_pressed() -> void:
	#Menu de controles
	return


func _on_options_focus_entered() -> void:
	arrow.position = Vector2(60, 470)
	arrow.visible = true


func _on_options_mouse_entered() -> void:
	arrow.position = Vector2(60, 470)
	arrow.visible = true

func _on_options_focus_exited() -> void:
	arrow.visible = false


func _on_options_mouse_exited() -> void:
	arrow.visible = false


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_quit_focus_entered() -> void:
	arrow.position = Vector2(60, 520)
	arrow.visible = true


func _on_quit_mouse_entered() -> void:
	arrow.position = Vector2(60, 520)
	arrow.visible = true


func _on_quit_focus_exited() -> void:
	pass # Replace with function body.


func _on_quit_mouse_exited() -> void:
	pass # Replace with function body.
