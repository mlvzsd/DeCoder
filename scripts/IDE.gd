extends Panel

signal action_request

func _on_RunButton_pressed():
	emit_signal("action_request", "run")

func _on_UndoButton_pressed():
	emit_signal("action_request", "undo")

func _on_HideButton_pressed():
	emit_signal("action_request", "hide")

func _on_GettersPanel_getter_called(cmd):
	cmd.position = Vector2(144, 80) # Force center spawm to test..
	add_child(cmd)
