extends Node2D

const MIN = 0
const MAX = 999

var moving
var by_left
var value = MIN

const NUMS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

func _ready():
	moving = true
	by_left = true
	$LeftDragButton.passby_press = true

# warning-ignore:unused_argument
func _process(delta):
	if moving:
		var new_pos = get_global_mouse_position()
		new_pos.x += 32 if by_left else -32
		
		position = new_pos

func str_android(num: int):
	var res := ""
	
	while(num > 0):
		res = NUMS[num%10] + res
		num /= 10
	
	return res if res else "0"

func clamp_android(num: int):
	if num < MIN:
		return MIN
	
	elif num > MAX:
		return MAX
	
	return  num

func _on_IncrementButton_pressed():
	value = clamp_android(value + 1)
	$ValueLabel.text = str_android(value)

func _on_DecrementButton_pressed():
	value = clamp_android(value - 1)
	$ValueLabel.text = str_android(value)

func _on_LeftDragButton_pressed():
	moving = true
	by_left = true
	z_index = 1
	$LeftDragButton.passby_press = false

func _on_RightDragButton_pressed():
	moving = true
	by_left = false
	z_index = 1

func _on_DragButton_released():
	moving = false
	z_index = 0
