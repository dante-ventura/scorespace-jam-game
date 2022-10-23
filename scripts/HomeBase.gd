extends Node2D

onready var buttons = [
	get_node("StartButton"),
	get_node("OptionsButton"),
	get_node("LeaderboardButton"),
	get_node("QuitButton")
]
onready var select_spr = get_node("SelectSprite")

var current_selection = 0

func _process(_delta):
	# warning-ignore:return_value_discarded
	if Input.is_action_just_pressed("menu_select"):
		AudioManager.get_node("MenuSelectAudio").play()
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
	select_spr.position.y = buttons[current_selection].start_pos.y + 32
	AudioManager.get_node("MenuHoverAudio").play()
