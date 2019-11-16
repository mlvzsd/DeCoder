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
	
	$Directions/CurSprite.show()
	
	event.action = action
	event.pressed = true
	Input.parse_input_event(event)

func cancel_input():
	event.pressed = false
	Input.parse_input_event(event)

func _ready():
	$Directions.hide()

func _input(event):
	if event is InputEventMouseMotion and $Directions.visible:
		var result = event.position - $Directions.position
		
		if result.length() > 16:
			if abs(result.x) > abs(result.y):
				turn_dir("ui_left" if result.x < 0 else "ui_right")
			
			else:
				turn_dir("ui_up" if result.y < 0 else "ui_down")
		
		elif $Directions/CurSprite.visible:
			$Directions/CurSprite.hide()
			cancel_input()

func _on_SpawnButton_pressed():
	$Directions.position = get_global_mouse_position()
	$Directions/CurSprite.hide()
	$Directions.show()

func _on_SpawnButton_released():
	cancel_input()
	$Directions.hide()
