extends Node2D

func _ready():
	$Player.start($StartPosition.position)

func _on_HUD_runned(script):
	$Bloix.exec(script)

func _on_HUD_undone():
	$Bloix.reset()
