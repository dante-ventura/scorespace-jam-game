extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = loadTime()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func loadTime():
	var file = File.new()
	file.open("user://leaderboard.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return content
