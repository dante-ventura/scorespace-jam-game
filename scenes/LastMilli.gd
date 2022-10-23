extends Label

func _ready():
	var time = loadTime()
	var milli = fmod(time, 1) * 1000
	text = "%03d" % [milli]
	pass # Replace with function body.


func loadTime():
	var file = File.new()
	file.open("user://leaderboardCurr.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
