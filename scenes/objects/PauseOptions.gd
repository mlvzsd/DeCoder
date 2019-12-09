extends Control

signal game_resumed

func _ready():
	hide()

func _on_ResumeButton_pressed():
	get_tree().paused = false
	hide()

func _on_QuiteButton_pressed():
	pass # Go main menu..
