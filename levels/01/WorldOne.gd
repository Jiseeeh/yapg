extends Node2D

signal level_complete

const WORLD_LEVEL = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collectibles = get_tree().get_nodes_in_group("Collectible")

	if len(collectibles) == 0:
		level_complete.emit()

		# increment the current world level only if the current level is the current world level
		if GameManager.current_world_level == WORLD_LEVEL:
			GameManager.current_world_level += 1
			GameManager.save_game()
		set_process(false)

		$Popup.visible = true
		await get_tree().create_timer(1.5).timeout
		$Popup.visible = false

		# show the level select screen
		get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_touch_screen_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
