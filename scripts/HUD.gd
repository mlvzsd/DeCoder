extends CanvasLayer

signal runned
signal undone

var showing_ide = false
var showing_pause = false

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
			showing_ide = false
	
	if Input.is_action_just_pressed("ui_pause"):
		if showing_ide:
			$AnimationPlayer.play("hide_ide")
			showing_ide = false
		
		elif showing_pause:
			$AnimationPlayer.play("hide_pause")
			showing_pause = false
		
		else:
			$AnimationPlayer.play("show_pause")
			showing_pause = true
			get_tree().paused = true

func _on_IDE_action_request(action, arg=null):
	match action:
		"run":
			$AnimationPlayer.play("hide_ide")
			showing_ide = false
			emit_signal("runned", $IDE.create_script()) # Send the code.
		"undo":
			$AnimationPlayer.play("hide_ide")
			showing_ide = false
			emit_signal("undone")
		"hide":
			$AnimationPlayer.play("hide_ide")
			showing_ide = false
