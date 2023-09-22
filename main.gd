extends Node2D


func _on_play_button_pressed():
	# or on to what current level (prolly on save)
	get_tree().change_scene_to_file("res://Levels/WorldOne.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
