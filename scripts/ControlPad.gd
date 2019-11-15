extends Control

func _on_PauseButton_pressed():
	pass # Thinking about..

func _on_IDESpawnButton_pressed():
	var event = InputEventAction.new()
	event.action = "ui_select"
	event.pressed = true
	Input.parse_input_event(event)
	
	yield(get_tree().create_timer(1), "timeout")
	event.pressed = false
	Input.parse_input_event(event)


