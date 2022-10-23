extends Node2D

onready var buttons = [
	get_node("Music/MusicButton"),
	get_node("Sfx/SfxButton"),
	get_node("BackButton")
]
onready var select_spr = get_node("SelectSprite")

var current_selection = 0

func _process(_delta):
	# warning-ignore:return_value_discarded
	if (Input.is_action_just_pressed("menu_select") and
		buttons[current_selection].get("switch_to_scene")):
		AudioManager.get_node("MenuSelectAudio").play()
		get_tree().change_scene(buttons[current_selection].switch_to_scene)
	
	var orig_selection = current_selection
	if (Input.is_action_just_pressed("menu_down") and
		current_selection < buttons.size()-1):
		current_selection += 1
	if (Input.is_action_just_pressed("menu_up") and
		current_selection > 0):
		current_selection -= 1
	
	handle_sliders()
	
	if orig_selection == current_selection:
		return
	
	buttons[orig_selection].is_selected = false
	buttons[current_selection].is_selected = true
	select_spr.position.x = buttons[current_selection].start_pos.x - 80
	select_spr.position.y = buttons[current_selection].start_pos.y + 32
	AudioManager.get_node("MenuHoverAudio").play()

func handle_sliders():
	if (Input.is_action_just_pressed("gameplay_rotate_left") and
		buttons[current_selection].get("slider_value_node")):
			var vol_label = get_node(buttons[current_selection].slider_value_node)
			var vol_int = int(vol_label.text)
			vol_int -= 1
			vol_int = max(0, vol_int)
			vol_label.text = String(vol_int)
			vol_label.update_volume()
	if (Input.is_action_just_pressed("gameplay_rotate_right") and
		buttons[current_selection].get("slider_value_node")):
			var vol_label = get_node(buttons[current_selection].slider_value_node)
			var vol_int = int(vol_label.text)
			vol_int += 1
			vol_int = min(10, vol_int)
			vol_label.text = String(vol_int)
			vol_label.update_volume()

func _input(event):
	if event.is_action_pressed("gameplay_pause"):
		get_tree().change_scene($BackButton.switch_to_scene)
