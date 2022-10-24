extends Node2D

func _ready():
	var time = loadTime()
	var mins = fmod(time, 60*60) / 60
	var secs = fmod(time, 60)
	var milli = fmod(time, 1) * 1000
	get_node("CanvasLayer/BestMin").text = "%02d" % [mins]
	get_node("CanvasLayer/BestSec").text = "%02d" % [secs]
	get_node("CanvasLayer/BestMilli").text = "%03d" % [milli]
	time = loadTimeLast()
	mins = fmod(time, 60*60) / 60
	secs = fmod(time, 60)
	milli = fmod(time, 1) * 1000
	get_node("CanvasLayer/LastMin").text = "%02d" % [mins]
	get_node("CanvasLayer/LastMin/LastSec").text = "%02d" % [secs]
	get_node("CanvasLayer/LastMin/LastSec/LastMilli").text = "%03d" % [milli]
	pass # Replace with function body.


func loadTime():
	var file = File.new()
	file.open("user://leaderboard.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
	
func loadTimeLast():
	var file = File.new()
	file.open("user://leaderboardCurr.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
	


func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/HomeBase.tscn")

func _input(event):
	if event.is_action_pressed("gameplay_pause"):
	# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/HomeBase.tscn")
