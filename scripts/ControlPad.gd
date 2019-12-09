extends Control

var event = InputEventAction.new()

func fake_just(action):
	event.action = action
	event.pressed = true
	Input.parse_input_event(event)
	
	yield(get_tree().create_timer(1), "timeout")
	event.pressed = false
	Input.parse_input_event(event)

func _on_PauseButton_pressed():
	fake_just("ui_pause")

func _on_IDESpawnButton_pressed():
	fake_just("ui_select")
