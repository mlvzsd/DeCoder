extends Control

var event = InputEventAction.new()

func turn_dir(action):
	cancel_input()
	
	match action:
		"ui_up":
			$Directions/CurSprite.transform = $Directions/UpSprite.transform
		"ui_down":
			$Directions/CurSprite.transform = $Directions/DownSprite.transform
		"ui_left":
			$Directions/CurSprite.transform = $Directions/LeftSprite.transform
		"ui_right":
			$Directions/CurSprite.transform = $Directions/RightSprite.transform
	
	event.action = action
	event.pressed = true
	Input.parse_input_event(event)

func cancel_input():
	event.pressed = false
	Input.parse_input_event(event)

func _ready():
	$Directions.hide()

# warning-ignore:unused_argument
func _process(delta):
	if $Directions.visible:
		$Directions/CurSprite.show()
		
		var result = get_global_mouse_position() - $Directions.position
		
		if result.length() > 16:
			if abs(result.x) > abs(result.y):
				turn_dir("ui_left" if result.x < 0 else "ui_right")
			
			else:
				turn_dir("ui_up" if result.y < 0 else "ui_down")
		
		else:
			$Directions/CurSprite.hide()

func _on_SpawButton_pressed():
	$Directions.position = get_global_mouse_position()
	$Directions.show()

func _on_SpawButton_released():
	cancel_input()
	$Directions.hide()
