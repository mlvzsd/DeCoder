extends Node2D

const MIN = 2
const MAX = 100

var value = MIN

func _on_IncrementButton_pressed():
	value += 1
	$ValueLabel.text = str(value)

func _on_DecrementButton_pressed():
	value -= 1
	$ValueLabel.text = str(value)
