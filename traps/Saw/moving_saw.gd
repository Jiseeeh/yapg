extends Path2D

@onready var path: PathFollow2D = $SawPath


# Called when the node enters the scene tree for the first time.
func _ready():
	$SawPath/RigidBody2D/AnimatedSprite2D.play("On")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	path.progress += 20 * delta
