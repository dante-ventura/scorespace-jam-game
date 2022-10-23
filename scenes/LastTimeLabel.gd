extends Label

func _ready():
	var time = loadTime()
	var mins = fmod(time, 60*60) / 60
	text = "%02d" % [mins]
	pass # Replace with function body.


func loadTime():
	var file = File.new()
	file.open("user://leaderboardCurr.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
