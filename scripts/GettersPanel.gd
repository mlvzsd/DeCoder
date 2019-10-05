extends Panel

signal getter_called

func emit_call(called):
	emit_signal("getter_called", called.Cmd.instance())

func _on_MoveGetter_pressed():
	emit_call($MoveGetter)

func _on_LoopGetter_pressed():
	emit_call($LoopGetter)
