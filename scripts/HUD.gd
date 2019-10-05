extends CanvasLayer

var showing_ide = false

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if showing_ide:
			$AnimationPlayer.play("hide_ide")
		
		else:
			$AnimationPlayer.play("show_ide")
		
		showing_ide = not showing_ide
	if Input.is_action_just_pressed("ui_cancel"):
		if showing_ide:
			$AnimationPlayer.play("hide_ide")
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
