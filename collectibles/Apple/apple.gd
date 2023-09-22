extends Collectible

const COLLECTIBLE_GOLD = 10

func _ready():
	$AnimatedSprite2D.play()
	set_collectible(self,COLLECTIBLE_GOLD)

func _on_body_entered(body):
	handle_on_body_entered(body)
