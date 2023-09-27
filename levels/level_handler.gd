# A class that handles the collectibles for every level
# It keeps track of how many collectibles have been collected
# and how many are left to collect
# It also checks if all collectibles have been collected
# and if so, the caller can emit the level_complete signal
class_name LevelHandler

var collected = 0
var target = 0
var current_world: Node2D


func _init(world: Node2D):
	current_world = world


func update_collected_fruits(label: Node):
	var collectibles = current_world.get_tree().get_nodes_in_group("Collectible")
	# only set target if it hasn't been set yet
	if target == 0:
		target = len(collectibles)

	collected = target - len(collectibles)
	label.text = "{collected}/{target}".format({"collected": collected, "target": target})


#  check if all collectibles have been collected
func has_collected_all_fruits() -> bool:
	var collectibles = current_world.get_tree().get_nodes_in_group("Collectible")
	if len(collectibles) == 0:
		return true
	else:
		return false
