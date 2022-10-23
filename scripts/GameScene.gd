extends Node2D

export(int) var current_level = 0

var score = 0
var player = preload("res://scenes/Player.tscn").instance()
var levels = { 
	1: preload("res://scenes/MazePrototype.tscn").instance()
}
var default_data = "0"

func _ready():
	next_level()

# Switches to next level in dict, if there is no next, 
# return false, true otherwise
func next_level():
	if current_level in levels:
		remove_child(levels[current_level])
	if player.is_inside_tree():
		remove_child(player)
	current_level += 1
	if !current_level in levels:
		show_leaderboard()
		return
	
	var new_level = levels[current_level]
	assert(new_level.is_in_group("Maze"))
	
	add_child(new_level)
	new_level.get_node("EndGoal").connect("body_exited", self, "_exited_end_goal")
	player.set_position(levels[current_level].get_node("SpawnPosition").global_position)
	add_child(player)

func _exited_end_goal(body: Node):
	if !body.is_in_group("Player"):
		return
	call_deferred("next_level")

func show_leaderboard():
# warning-ignore:return_value_discarded
	get_node("Timer").timer_on = false
	saveTime(get_node("Timer").time)
	get_tree().change_scene("res://scenes/LeaderboardBase.tscn")
	# Load leaderboard scene and send new time


func saveTime(content):
	var file = File.new()
	if not file.file_exists("user://leaderboard.txt"):
		file.open("user://leaderboard.txt", File.WRITE)
		file.store_string("9999999")
		file.close()
	var loadedTime = loadTime()
	file.open("user://leaderboardCurr.txt", File.WRITE)
	file.store_string(str(content))
	file.close()
	if(loadedTime > content):
		file.open("user://leaderboard.txt", File.WRITE)
		file.store_string(str(content))
	file.close()



func loadTime():
	var file = File.new()
	file.open("user://leaderboard.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
	
