extends Node2D


const WIDTH=280
const HEIGHT=160

enum DIR {
	DOWN
	LEFT
	UP
	RIGHT
}

var code = "{turn_left, ahead, ahead, turn_right, ahead, ahead, back}"
var cur_dir = DIR.DOWN 

class Command:
	var cmd: String
	var args

	func _init(cmd, args = null):
		self.cmd = cmd
		if args != null: self.args = args

# Called when the node enters the scene tree for the first time.
func _ready():
	print(first_parse(code))
	exec(code)
	
#Execute the given program as string
func exec(program: String):
	var parsed = first_parse(program)
	# call("turn_right")
	for bin in parsed[0].split(","):
		call(bin)

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

#func for(code):
#	pass

# turn direction 90 degree to right
func turn_right():
	cur_dir = (cur_dir + 1 + 4) % 4
	print(cur_dir)
# turn direction 90 degree to left
func turn_left():
	cur_dir = (cur_dir - 1 + 4) % 4
	print(cur_dir)
# go in oposite of current direction
func back():
	go((cur_dir - 2 + 4) % 4)

# go in current direction
func ahead():
	go(cur_dir)

func go(dir):
	match dir:
		DIR.UP:
			up()
			print("up")
		DIR.DOWN:
			down()
			print("down")
		DIR.LEFT:
			left()
			print("left")
		DIR.RIGHT:
			right()
			print("right")
		var err:
			print(err, ": unspected value")

	pass
#Map block code to each name
func map_code(program: String, delimiter := ["{", "}"] ):
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
func first_parse(program: String):
	
	#Remove all spaces from program
	program = program.split(" ").join("")
	
	#if string is empty, returns zero
	if program.empty():
		return 0
	
	var codes = [] # Storage blocks
	var buffer = "" # buffer for block assembly
		
	for i in range(program.length()):
		var c = program[i] # current char
	
		if c == "{": continue
	
		elif c == "}": # add the block to code list if reach its end 
			codes.push_back(buffer)
			buffer = ""
			
		else: buffer += c
	
	return codes
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
