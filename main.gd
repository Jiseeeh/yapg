extends Node2D


func _ready():
	GameManager.load_game()


func _on_play_button_pressed():
	# TODO: move to world_level select
	get_tree().change_scene_to_file("res://levels/01/WorldOne.tscn")


func _on_quit_button_pressed():
	GameManager.save_game()
	get_tree().quit()


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST || NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_play_button_pressed()
