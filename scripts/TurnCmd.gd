extends Node2D

var ide
var height = 32

func _on_TurnButton_pressed():
	if $RotationSprite.region_rect.position.x == 0:
		$RotationSprite.region_rect.position.x = 32
	
	else:
		$RotationSprite.region_rect.position.x = 0

func get_inst():
	if $RotationSprite.region_rect.position.x == 0:
		return "turn_left"
	
	else:
		return "turn_right"

func focus(value):
	$FocusSprite.visible = value

func _on_FocusButton_pressed():
	ide.focus(self)
