extends Node

var player_health: int = 10
var player_gold: int = 0
var current_world_level: int = 1
var character = ""

const SAVE_PATH = "user://savegame.bin"


func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	var data = {
		"player_health": player_health,
		"player_gold": player_gold,
		"current_world_level": current_world_level,
	}

	var json_str = JSON.stringify(data)
	file.store_line(json_str)


func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)

	if FileAccess.file_exists(SAVE_PATH):
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				player_health = current_line["player_health"]
				player_gold = current_line["player_gold"]
				current_world_level = current_line["current_world_level"]
