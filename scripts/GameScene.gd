extends Node2D

export(int) var current_level = 0

var player = preload("res://scenes/Player.tscn").instance()
var levels = { 
	1: preload("res://scenes/MazePrototype.tscn").instance() 
}

func _ready():
	next_level()

# Switches to next level in dict, if there is no next, 
# return false, true otherwise
func next_level():
	if current_level in levels:
		remove_child(levels[current_level])
	if is_instance_valid(player):
		remove_child(player)
	current_level += 1
	if !current_level in levels:
		return false
	add_child(levels[current_level])
	player.set_position(levels[current_level].get_node("SpawnPosition").global_position)
	add_child(player)
	return true
