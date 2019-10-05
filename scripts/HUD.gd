extends CanvasLayer

var showing_ide = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if showing_ide:
			$AnimationPlayer.play("hide_ide")
		
		else:
			$AnimationPlayer.play("show_ide")
		
		showing_ide = not showing_ide

func _on_IDE_action_request(action):
	match action:
		"run":
			pass
		"undo":
			pass
		"hide":
			$AnimationPlayer.play("hide_ide")
			showing_ide = false
