extends Node2D

const Parser = preload("Parser.gd")



const WIDTH=280
const HEIGHT=160


enum DIR {
	DOWN
	LEFT
	UP
	RIGHT
}

# main:{ ahead; ahead; for 7 {ahead; ahead}; turn_left; back; keijo } keijo: { ahead }

# var code = "main:[turn_left ahead/ ahead/ for 3 [ turn_right ] / ahead/ ahead/ back] kaiju:[hentai/ tentaculo/ tentaculo]"
var code = "main:[ gentoo ] gentoo:[ ahead / ahead ]"

var cur_dir = DIR.DOWN 


# Called when the node enters the scene tree for the first time
func _ready():
	exec(code)
#Execute the given program as string
func exec(program: String, fun := "main"):
	var cod = Parser.parse(program, ["[", "]"], "/")

	for cmd in cod[fun]:
		if cod.keys().has(cmd.cmd):
			exec(program, cmd.cmd)
		
		else:
			call(cmd.cmd, cmd.args)
		
		yield(get_tree().create_timer(1), "timeout")

	pass
#Go to right
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

#func for(code):
#	pass

# turn direction 90 degree to right
func turn_right(a):
	cur_dir = (cur_dir + 1 + 4) % 4
	print(cur_dir)
# turn direction 90 degree to left
func turn_left(a):
	cur_dir = (cur_dir - 1 + 4) % 4
	print(cur_dir)
# go in oposite of current direction
func back(a):
	go((cur_dir - 2 + 4) % 4)

# go in current direction
func ahead(a):
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
	
	
