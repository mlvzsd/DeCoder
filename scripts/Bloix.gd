extends Node2D

const Parser = preload("Parser.gd")

const SIZE=16

enum DIR {
	DOWN
	LEFT
	UP
	RIGHT
}

var default_position
var code = "main:{ giradinha } giradinha:{ vira, vira, vira, } vira:{ ahead, ahead, turn_left}"
var cur_dir : int = DIR.DOWN 

# Called when the node enters the scene tree for the first time
func _ready():
	default_position = transform.get_origin()

func reset():
	cur_dir = DIR.DOWN
	position = default_position
	
func start(pos):
	position = pos
	default_position = pos

#Execute the given program as string
func exec(program: String, fun := "main"):
	var cod = Parser.parse(program, ["{", "}"], ",")

	for cmd in cod[fun]:
		yield(get_tree().create_timer(.5), "timeout")
		
		if cod.keys().has(cmd.cmd):
			exec(program, cmd.cmd)
		
		else:
			call(cmd.cmd, cmd.args)

#Go to right
func right():
	var x = position.x
	
	x += SIZE
	
	position.x = x

# Go to 16pixel left
func left():
	var x = position.x
	
	x -= SIZE
	
	position.x = x

#Go to 16pixel down
func down():
	var y = position.y
	
	y += SIZE
	
	position.y = y

# Go to 16pixel up
func up():
	var y = position.y
	
	y -= SIZE
	
	position.y = y

#func for(code):
#	pass

# turn direction 90 degree to right
func turn_right(a):
	cur_dir = (cur_dir + 1 + 4) % 4
	#$Sprite.rotation_degrees -= 90
	print(cur_dir)

# turn direction 90 degree to left
func turn_left(a):
	cur_dir = (cur_dir - 1 + 4) % 4
	#$Sprite.rotation_degrees += 90
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
