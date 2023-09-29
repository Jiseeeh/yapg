class_name AnimationHandler


func handle_animation(anim_player: AnimationPlayer, player_velocity: Vector2, is_hit: bool) -> void:
	# play animation hit one time only is hit
	if is_hit:
		anim_player.play("Hit")
		return

	# if not moving
	if player_velocity == Vector2.ZERO:
		anim_player.play("Idle")
	# moving and is on floor
	elif player_velocity.x and player_velocity.y == 0:
		anim_player.play("Run")
	# jumping
	elif not player_velocity.y == 0:
		if player_velocity.y > 0:
			anim_player.play("Fall")
		else:
			anim_player.play("Jump")
