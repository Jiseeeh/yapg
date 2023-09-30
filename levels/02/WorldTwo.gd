extends Node2D

signal level_complete

const WORLD_LEVEL = 2
const STARTING_POSITION = Vector2(40, 80)

var level_handler = LevelHandler.new(self)
var player_character: PackedScene


func _ready():
	# inject sound effects
	SoundManager.inject_stream_players()
	SoundManager.play_bg_music()
	# reset player health
	GameManager.player_health = 3
	level_handler.update_collected_fruits($WorldControls/CollectedFruitsLabel)

	var player = GameManager.get_character_node()
	player.position = STARTING_POSITION
	# connect level complete signal to player character
	level_complete.connect(player.handle_on_level_complete)

	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	level_handler.update_collected_fruits($WorldControls/CollectedFruitsLabel)

	if level_handler.has_collected_all_fruits():
		level_complete.emit()

		# increment the current world level only if the current level is the current world level
		if GameManager.current_world_level == WORLD_LEVEL:
			GameManager.current_world_level += 1
			GameManager.save_game()
		set_process(false)

		$Popup.visible = true
		await get_tree().create_timer(1.5).timeout
		$Popup.visible = false

		# stop the background music
		SoundManager.stop_bg_music()
		# show the level select screen
		get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_restart_button_pressed():
	get_tree().reload_current_scene()


func _on_back_button_pressed():
	SoundManager.stop_bg_music()
	get_tree().change_scene_to_file("res://levels/level_select.tscn")
