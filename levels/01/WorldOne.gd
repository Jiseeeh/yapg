extends Node2D

signal level_complete


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collectibles = get_tree().get_nodes_in_group("Collectible")

	if len(collectibles) == 0:
		level_complete.emit()
		set_process(false)
