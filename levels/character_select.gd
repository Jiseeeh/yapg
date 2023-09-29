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


func _on_frog_man_button_pressed():
	GameManager.character = "FrogMan"
	get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_mask_dude_button_pressed():
	GameManager.character = "MaskDude"
	get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_pink_man_button_pressed():
	GameManager.character = "PinkMan"
	get_tree().change_scene_to_file("res://levels/level_select.tscn")


func _on_virtual_guy_button_pressed():
	GameManager.character = "VirtualGuy"
	get_tree().change_scene_to_file("res://levels/level_select.tscn")
