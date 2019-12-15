extends Node2D

var ide
var height = 32

func _on_TurnButton_pressed():
	if $DirectionSprite.region_rect.position.x == 0:
		$DirectionSprite.region_rect.position.x = 32
	
	else:
		$DirectionSprite.region_rect.position.x = 0

func get_inst():
	if $DirectionSprite.region_rect.position.x == 0:
		return "ahead"
	
	else:
		return "back"

func focus(value):
	$FocusSprite.visible = value

func _on_FocusButton_pressed():
	ide.focus(self)
