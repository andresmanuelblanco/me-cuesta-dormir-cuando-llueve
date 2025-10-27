extends CanvasLayer

@onready var fade_rect = $ColorRect

func fade_out(duration: float = 1.0) -> void:
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)
	await tween.finished

func fade_in(duration: float = 1.0) -> void:
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, duration)
	await tween.finished
