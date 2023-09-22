class_name Collectible
extends Node

var collectible : Object
var collectible_gold: int = 5

func handle_on_body_entered(body: Node2D):
	# TODO: Change to character if multiple chars is supported
	if body.name == "FrogMan":
		# TODO: increment player gold (Game manager)
		print("Collected gold: %s" % str(collectible_gold))
		collectible_tween()

func collectible_tween() -> void:
	# TODO: play sound collected
	var pos_tween = get_tree().create_tween()
	var opac_tween = get_tree().create_tween()
	pos_tween.tween_property(collectible,"position", collectible.position - Vector2(0,40),1)
	opac_tween.tween_property(collectible,"modulate:a",0,0.5)
	pos_tween.tween_callback(queue_free)

func set_collectible(collectible_obj: Object, gold: int) -> void:
	self.collectible = collectible_obj
	self.collectible_gold = gold
