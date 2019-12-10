extends Panel

signal action_request

const FACTOR = Vector2(32, 0)

func _on_RunButton_pressed():
	emit_signal("action_request", "run")

func _on_UndoButton_pressed():
	emit_signal("action_request", "undo")

func _on_HideButton_pressed():
	emit_signal("action_request", "hide")

func _on_GettersPanel_getter_called(cmd):
	cmd.position = get_global_mouse_position() + FACTOR
	add_child(cmd)
