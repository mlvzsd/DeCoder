extends Node2D

func _on_TurnButton_pressed():
	if $RotationSprite.region_rect.position.x == 0:
		$RotationSprite.region_rect.position.x = 32
	
	else:
		$RotationSprite.region_rect.position.x = 0
