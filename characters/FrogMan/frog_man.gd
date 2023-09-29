extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const TRAP_GROUPS = ["Saw", "Spike"]  # Add here the groups of the traps that can hit the player

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hit_cooldown = 0.62
var elapsed_time_since_last_hit = 0.0
var is_hit = false
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var anim_handler: AnimationHandler = AnimationHandler.new()


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

	if not is_hit and collision:
		for group in collision.get_collider().get_groups():
			if TRAP_GROUPS.has(group):
				is_hit = true
				print("Got hit")

	anim_handler.handle_animation(anim_player, velocity, is_hit)


func handle_on_level_complete():
	set_process(false)
