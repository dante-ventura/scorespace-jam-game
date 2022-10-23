extends Node

func _ready():
	AudioServer.set_bus_volume_db(1, -20)
	AudioServer.set_bus_volume_db(2, -20)

func _process(_delta):
	manage_music()

func manage_music():
	var cur_scene = get_tree().current_scene.name
	if (cur_scene == "HomeScreenScene" and
		!$MenuMusic.playing):
		$GameMusic.stop()
		$MenuMusic.play()
		return
	if (cur_scene == "GameScene" and
		!$GameMusic.playing):
		$MenuMusic.stop()
		$GameMusic.play()
		return
