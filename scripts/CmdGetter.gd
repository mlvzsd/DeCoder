extends TouchScreenButton

signal called_for_get

class_name CmdGetter

export (PackedScene) var Cmd

func _on_Getter_pressed():
	emit_signal("called_for_get", Cmd)
