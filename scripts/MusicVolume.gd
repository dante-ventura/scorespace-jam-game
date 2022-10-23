extends Label

var music_bus_idx = AudioServer.get_bus_index("Music")

func _ready():
	if AudioServer.is_bus_mute(music_bus_idx):
		text = "0"
		return
	var db_vol = AudioServer.get_bus_volume_db(music_bus_idx)
	var vol_as_str = String((db_vol+35)/3)
	text = vol_as_str

func update_volume():
	var vol_int = int(text)
	if vol_int == 0: 
		AudioServer.set_bus_mute(music_bus_idx, true)
		return
	AudioServer.set_bus_mute(music_bus_idx, false)
	AudioServer.set_bus_volume_db(music_bus_idx, vol_int*3-35)
