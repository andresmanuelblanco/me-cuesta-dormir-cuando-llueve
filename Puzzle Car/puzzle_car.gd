extends Node3D

@onready var alarm_sound: AudioStreamPlayer3D = $Alarm
@onready var lock_sound: AudioStreamPlayer3D = $Lock

var puzzle_car_solved: bool = false

func _ready() -> void:
	alarm_sound.play()

func stop_alarm():
	alarm_sound.stop()
	lock_sound.play()
	puzzle_car_solved = true
	
func is_puzzle_car_solved():
	return puzzle_car_solved
