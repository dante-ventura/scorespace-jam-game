extends Control

func _input(event):
	if event.is_action_pressed("gameplay_pause"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused