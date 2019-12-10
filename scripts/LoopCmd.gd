extends Node2D

const MIN = 0
const MAX = 999

var value = MIN

const NUMS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

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
