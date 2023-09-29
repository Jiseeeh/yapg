extends Node2D

signal level_complete

const WORLD_LEVEL = 1
const STARTING_POSITION = Vector2(34, 280)

var level_handler = LevelHandler.new(self)
var player_character: PackedScene


func _ready():
	level_handler.update_collected_fruits($WorldControls/CollectedFruitsLabel)
	print(GameManager.character)
	match GameManager.character:
		"FrogMan":
			player_character = load("res://characters/FrogMan/frog_man.tscn")
		"MaskDude":
			player_character = load("res://characters/MaskDude/mask_dude.tscn")
		"PinkMan":
			player_character = load("res://characters/PinkMan/pink_man.tscn")
		"VirtualGuy":
			player_character = load("res://characters/VirtualGuy/virtual_guy.tscn")

	var player = player_character.instantiate()
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

		# show the level select screen
		get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_restart_button_pressed():
	get_tree().reload_current_scene()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_select.tscn")
