extends Node2D

func _on_ButtonStart_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/GameScene.tscn")


func _on_ButtonOptions_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/SettingsScene.tscn")


func _on_ButtonLeaderboard_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/GameScene.tscn")
