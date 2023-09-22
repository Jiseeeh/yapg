extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# prevent jumping again if not on floor
	if Input.is_action_just_pressed("jump") and is_on_floor():
#		anim_player.play("Jump")
		velocity.y = JUMP_VELOCITY
	
	# returns either -1,0, or 1
	# -1 for left axis, 1 for the right axis and 0 if neither
	var direction = Input.get_axis("move_left","move_right")
	
	# if truthy ( 1 or -1 ) move the character
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
	# else stop by moving from the curr position to 0
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
	
	move_and_slide()
	update_animation()

func update_animation():
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
	# if hit
