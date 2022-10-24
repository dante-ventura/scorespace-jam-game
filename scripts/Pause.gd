extends Control

onready var buttons = [
	get_node("OptionsButton"),
	get_node("ExitButton")
]

onready var select_spr = get_node("SelectSprite")

var current_selection = 0
var re_paused = true

func _process(_delta):
	# warning-ignore:return_value_discarded
	if get_parent().has_node("SettingsScene"):
		return
	elif !re_paused:
		get_tree().paused = true
		visible = true
		re_paused = true
	
	if !visible:
		return
	
	if (Input.is_action_just_pressed("menu_select") and
		buttons[current_selection].name == "OptionsButton"):
		var options_scene = load("res://scenes/SettingsScene.tscn").instance()
		options_scene.pause_mode = Node.PAUSE_MODE_PROCESS
		get_parent().add_child(options_scene)
		re_paused = false
		AudioManager.get_node("MenuSelectAudio").play()
	elif Input.is_action_just_pressed("menu_select"):
		AudioManager.get_node("MenuSelectAudio").play()
		toggle_pause()
		get_tree().change_scene(buttons[current_selection].switch_to_scene)
	
	var orig_selection = current_selection
	if (Input.is_action_just_pressed("menu_down") and
		current_selection < buttons.size()-1):
		current_selection += 1
	if (Input.is_action_just_pressed("menu_up") and
		current_selection > 0):
		current_selection -= 1
	
	if orig_selection == current_selection:
		return
	
	buttons[orig_selection].is_selected = false
	buttons[current_selection].is_selected = true
	select_spr.position.x = buttons[current_selection].start_pos.x - 80
	select_spr.position.y = buttons[current_selection].start_pos.y + 25
	AudioManager.get_node("MenuHoverAudio").play()

func _input(event):
	if event.is_action_pressed("gameplay_pause"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused
