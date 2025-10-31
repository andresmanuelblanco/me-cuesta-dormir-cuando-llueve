extends Node

var puzzle_list = ["res://Puzzle Police/puzzle_police.tscn", "res://Puzzle Wet Dog/puzzle_wet_dog.tscn"]

var game_finished: bool = false
var game_started: bool = false

func game_start():
	game_started = true

func get_game_finished():
	return game_finished

func random_new_puzzle(list):
	var chosen_puzzle = ""
	if (list.size() != 0):
		var random_index = randi() % list.size()
		chosen_puzzle = puzzle_list[random_index] #SUEÑO
		list.remove_at(random_index)
	else:
		chosen_puzzle = "res://room.tscn"
		game_finished = true
	return chosen_puzzle
	
func get_puzzle_list():
	return puzzle_list
	
func reset():
	puzzle_list = ["res://Puzzle Police/puzzle_police.tscn", "res://Puzzle Wet Dog/puzzle_wet_dog.tscn"]
