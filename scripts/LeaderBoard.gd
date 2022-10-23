extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var time = loadTime()
	var secs = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60
	var milli = fmod(time, 1) * 1000
	text = "Best Time\n%02d:%02d:%03d" % [mins,secs,milli]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func loadTime():
	var file = File.new()
	file.open("user://leaderboard.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
