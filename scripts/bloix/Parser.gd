class_name Parser

const blank_chars = ['\n', '\t', ' ']

class Command:
	var cmd: String
	var args: Array

	func _init(cmd, args = null):
		self.cmd = cmd 
		if args != null: self.args = args

static func parse(program: String, delimiter := [ '{', '}' ], separator := ',') -> Dictionary:
	var map = parse_map(program, delimiter)
	
	var res = {}
	
	for key in map.keys():
		var command := []
	
		var aux = arrayer(map[key], separator)
	
		for cmd in aux:
			command.append(to_command(cmd))
		
		res[key] = command

	return res

static func parse_map(program: String, delimiter: PoolStringArray) -> Dictionary:
	var brace_level = 0
	var map = {}
	
	var i: int = 0
	
	while i < program.length():
		var key: String
		var block: String
		
		for c in program.substr(i, program.length() - i):
			i += 1
			if c == ':':
				break
			
			elif !blank_chars.has(c):
				key += c
			
		for c in program.substr(i, program.length() - i):		
			i += 1
			if c == delimiter[0] :
				brace_level += 1
				
			
				if brace_level == 1:
					continue
			
			if c == delimiter[1]:
				brace_level -= 1
			
				if brace_level == 0:
					break
			
			block += c
		
		map[key] = block
	
	return map

static func arrayer(cmd: String, separator: String) -> PoolStringArray:
	var res = PoolStringArray()
	
	var buffer = ""
	
	for c in cmd:
		if blank_chars.has(c):
			print(c, " -> ", "blank")			
			pass
			
		elif c == separator:
			print(c, " -> ", "sep")
			if buffer:
				res.append(buffer)
			buffer = ""
			continue
		
		else:
			print(c, " -> ", "normal")
			buffer += c
	if buffer:
		res.append(buffer)
	print(res)
	
	return res 

static func to_command(command: String) -> Command:
	
	var buffer: String = ""
	
	var aux: Array
	
	print("command: ", command)
	
	for c in command:
		if !blank_chars.has(c):
			print("(", c, ")")
			buffer += c
			continue
			
		if buffer != "":
			aux.append(buffer)
			print ("[", buffer, "]")
			buffer = ""
		
		#else:
		#	buffer = ""
		
	if buffer:
		aux.append(buffer)
	
	var aux0 = aux.pop_front()
	
	print("0: [", aux0, "]")
	print("1: ", aux)
	print("---")
	
	return Command.new(aux0, aux if aux else null)
