extends Node2D

func _on_MusicSlider_value_changed(_value):
# warning-ignore:return_value_discarded
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("gameplay_pause"):
		get_tree().change_scene("res://scenes/HomeBase.tscn")

func _on_SfxSlider_value_changed(_value):
# warning-ignore:return_value_discarded
	pass # Replace with function body.


func _on_ButtonHome_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/HomeBase.tscn")
