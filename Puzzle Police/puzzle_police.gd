extends Node3D

var police_talked_with : int = 0
var puzzle_police_solved : bool #Esta resuelto o no?
#var puzzle_police_lost : bool = false #Se puede resolver o no?

func talk_to_police():
	police_talked_with += 1
	
func is_puzzle_police_solved():
	if (police_talked_with >= 2):
		puzzle_police_solved = true
	else:
		puzzle_police_solved = false
	return puzzle_police_solved
