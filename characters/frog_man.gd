extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hit_cooldown = 0.62
var elapsed_time_since_last_hit = 0.0
var is_hit = false
@onready var anim_player: AnimationPlayer = $AnimationPlayer


func _process(delta):
	if is_hit:
		print("Cooling down")
		elapsed_time_since_last_hit += delta
		if elapsed_time_since_last_hit > hit_cooldown:
			print("Can be hit again")
			is_hit = false
			elapsed_time_since_last_hit = 0.0

	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# prevent jumping again if not on floor
	if Input.is_action_just_pressed("jump") and is_on_floor():
#		anim_player.play("Jump")
		velocity.y = JUMP_VELOCITY

	# returns either -1,0, or 1
	# -1 for left axis, 1 for the right axis and 0 if neither
	var direction = Input.get_axis("move_left", "move_right")

	# if truthy ( 1 or -1 ) move the character
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
	# else stop by moving from the curr position to 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var collision = get_last_slide_collision()
	if not is_hit and collision and collision.get_collider().get_name() == "Spike":
		is_hit = true
		print("Got hit")

	update_animation()


func update_animation():
	# play animation hit one time only is hit
	if is_hit:
		anim_player.play("Hit")
		return

	# if not moving
	if velocity == Vector2.ZERO:
		anim_player.play("Idle")
	# moving and is on floor
	elif velocity.x and is_on_floor():
		anim_player.play("Run")
	# jumping
	elif not is_on_floor():
		if velocity.y > 0:
			anim_player.play("Fall")
		else:
			anim_player.play("Jump")


func handle_on_level_complete():
	set_process(false)
