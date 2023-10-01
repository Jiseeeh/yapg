extends Node2D


func _on_timer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"rotation",rotation + PI,1.0)
