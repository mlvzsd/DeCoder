extends Panel

signal action_request

func _on_RunButton_pressed():
	emit_signal("action_request", "run")

func _on_UndoButton_pressed():
	emit_signal("action_request", "undo")

func _on_HideButton_pressed():
	emit_signal("action_request", "hide")


