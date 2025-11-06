extends Node3D

@onready var end_text = $CanvasLayer/Label
@onready var player = $Player
@onready var rain = $Rain_Realish
@onready var rain_sound = $AudioStreamPlayer

func _ready():
	if (Global.get_game_finished()):
		print("Game finished")
		end_game()

func end_game():
	end_text.visible = true
	player.can_move = false
	rain.visible = false
	rain_sound.volume_db = -75
