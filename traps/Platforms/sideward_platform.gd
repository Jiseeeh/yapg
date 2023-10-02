extends Node2D

@onready var platform_path = $Path2D/PathFollow2D

func _ready():
	$Path2D/PathFollow2D/StaticBody2D/AnimatedSprite2D.play("On")

func _physics_process(delta):
	platform_path.progress += 20 * delta
