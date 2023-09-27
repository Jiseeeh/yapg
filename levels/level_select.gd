extends Node2D

var current_world_level = GameManager.current_world_level


func _ready():
	# get all children of this node
	var children = get_children()

	for i in range(current_world_level):
		# increase the alpha value of the unlocked levels
		# to show that they are unlocked
		children[i].modulate.a = 255


func is_level_unlocked(level: int) -> bool:
	return current_world_level >= level


func _on__pressed_01():
	if is_level_unlocked(1):
		get_tree().change_scene_to_file("res://levels/01/WorldOne.tscn")


func _on__pressed_02():
	is_level_unlocked(2)


func _on__pressed_03():
	is_level_unlocked(3)


func _on__pressed_04():
	is_level_unlocked(4)


func _on__pressed_05():
	is_level_unlocked(5)


func _on__pressed_final():
	is_level_unlocked(6)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
