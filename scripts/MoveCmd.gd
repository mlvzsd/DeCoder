extends Node2D

var moving
var by_left

func _ready():
	moving = true
	by_left = true

# warning-ignore:unused_argument
func _process(delta):
	if moving:
		var new_pos = get_global_mouse_position()
		new_pos.x += 32 if by_left else -32
		
		position = new_pos

func _on_LeftDragButton_pressed():
	moving = true
	by_left = true

func _on_RightDragButton_pressed():
	moving = true
	by_left = false

func _on_DragButton_released():
	moving = false
