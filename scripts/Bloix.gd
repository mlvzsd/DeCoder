extends Node2D

const RIGHT="right"
const LEFT="left"
const DOWN="down"
const UP="up"

const WIDTH=288
const HEIGHT=160

var code = "{right, right, down, down}"

# Called when the node enters the scene tree for the first time
func _ready():
	print(first_parse(code))
	exec(code)
	
# Execute the given program as string
func exec(program):
	var parsed = first_parse(program)
	
	for bin in parsed[0].split(","):
		yield(get_tree().create_timer(.5), "timeout")
		
		if bin == RIGHT:
			right()
		
		elif bin == LEFT:
			left()
			
		elif bin == UP:
			up()
			
		elif bin == DOWN:
			down()
	
# Go to right
func right():
	var x = position.x
	
	x += 16
	
	position.x = x if x < WIDTH else WIDTH #Don't exit the screen

# Go to 16pixel left
func left():
	var x = position.x
	
	x -= 16
	
	position.x = x if x > 0 else 0 #Don't exit the screen

#Go to 16pixel down
func down():
	var y = position.y
	
	y += 16
	
	position.y = y if y < HEIGHT else HEIGHT #Don't exit the screen

# Go to 16pixel up
func up():
	var y = position.y
	
	y -= 16
	
	position.y = y if y > 0 else 0 #Don't exit the screen
	
# Map block code to each name
func map_code(program):
	var out_block = true
	var key_buffer = ""
	var value_buffer = ""
	var map
	
	for c in program.length():
		if out_block and c == ":":
			out_block = false
		
		elif c == "}":
			out_block = true
			value_buffer += c
		if out_block:
			key_buffer += c
		
		else:
			value_buffer += c
		
	pass
# Return the blocks of code of given string or return 0
func first_parse(program):
	
	# Remove all spaces from program
	program = program.split(" ").join("")
	
	# If string is empty, returns zero
	if program.empty():
		return 0
	
	var codes = [] # Storage blocks
	var buffer = "" # Buffer for block assembly
		
	for i in range(program.length()):
		var c = program[i] # current char
	
		if c == "{": 
			continue
	
		elif c == "}": # Add the block to code list if reach its end 
			codes.push_back(buffer)
			buffer = ""
			
		else:
			buffer += c
	
	return codes
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
