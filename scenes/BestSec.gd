extends Label


func _ready():
	var time = loadTime()
	var secs = fmod(time, 60)	
	text = "%02d" % [secs]
	pass # Replace with function body.


func loadTime():
	var file = File.new()
	file.open("user://leaderboard.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
