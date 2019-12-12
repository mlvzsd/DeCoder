extends Control

func _ready():
	hide()

var event = InputEventAction.new()

func fake_just(action):
	event.action = action
	event.pressed = true
	Input.parse_input_event(event)
	
	yield(get_tree().create_timer(1), "timeout")
	event.pressed = false
	Input.parse_input_event(event)

func _on_ResumeButton_pressed():
	get_tree().paused = false
	fake_just("ui_pause")

func _on_QuiteButton_pressed():
	get_tree().quit()
	pass # Go main menu..
