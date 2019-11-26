extends Node2D



const RIGHT="right"
const LEFT="left"
const DOWN="down"
const UP="up"

const WIDTH=288
const HEIGHT=160

var code = "main:{right, right, right, down, down}"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(first_parse(code))
	#exec(code)
	
#Execute the given program as string
func exec(program):
	var parsed = first_parse(program)
	
	for bin in parsed[0].split(","):
		if bin == RIGHT:
			right()
		
		if bin == LEFT:
			left()
			
		if bin == UP:
			up()
			
		if bin == DOWN:
			down()
	
#Go to right
func right():
	var x = position.x
	
	x += 16
	
	position.x = x if x < WIDTH else WIDTH #Don't exit the screen

#Go to 16pixel left
func left():
	var x = position.x
	
	x -= 16
	
	position.x = x if x > 0 else 0 #Don't exit the screen

#Go to 16pixel down
func down():
	var y = position.y
	
	y += 16
	
	position.y = y if y < HEIGHT else HEIGHT #Don't exit the screen

#Go to 16pixel up
func up():
	var y = position.y
	
	y -= 16
	
	position.y = y if y > 0 else 0 #Don't exit the screen
	

# Return the blocks of code of given string or return 0
func first_parse(program):
	
	#Remove all spaces from program
	program = program.split(" ").join("")
	
	#if string is empty, returns zero
	if program.empty():
		return 0
	
	var codes = [] # Storage blocks
	var buffer = "" # buffer for block assembly
		
	for i in range(program.length()):
		var c = program[i] # current char
	
		if c == "{": 
			continue
	
		elif c == "}": # add the block to code list if reach its end 
			codes.push_back(buffer)
			buffer = ""
			
		else:
			buffer += c
	
	return codes
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
