extends Control

func _input(event):
	if event.is_action_pressed("gameplay_pause"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused


func _on_PauseButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/HomeBase.tscn")
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused
