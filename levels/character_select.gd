extends Node2D

@onready var frog_man: AnimatedSprite2D = $FrogManButton/FrogMan
@onready var mask_dude: AnimatedSprite2D = $MaskDudeButton/MaskDude
@onready var pink_man: AnimatedSprite2D = $PinkManButton/PinkMan
@onready var virtual_guy: AnimatedSprite2D = $VirtualGuyButton/VirtualGuy


func _ready():
	frog_man.play("Idle")
	mask_dude.play("Idle")
	pink_man.play("Idle")
	virtual_guy.play("Idle")
