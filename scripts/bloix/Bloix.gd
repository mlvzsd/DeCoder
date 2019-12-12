extends Node2D


const Parser = preload("Parser.gd")

# main:{ ahead; ahead; for 7 {ahead; ahead}; turn_left; back; keijo } keijo: { ahead }

# var code = "main:[turn_left ahead/ ahead/ for 3 [ turn_right ] / ahead/ ahead/ back] kaiju:[hentai/ tentaculo/ tentaculo]"

#Execute the given program as string
func exec(program: String, fun := "main"):
	var cod = Parser.parse(program, ["[", "]"], ",")
	for cmd in cod[fun]:
		if cod.keys().has(cmd.cmd):
			exec(program, cmd.cmd)
		
		else:
			call(cmd.cmd, cmd.args)
		
		yield(get_tree().create_timer(.3), "timeout")

	pass
