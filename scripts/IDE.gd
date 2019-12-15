extends Panel

signal action_request

const FACTOR = Vector2(32, 0)

var cmds = []
var focused

func range_android(begin, end):
	var ranger = []
	
	while begin < end:
		ranger.append(begin)
		begin += 1
	
	return ranger

func create_script():
	var script = "main:{"
	
	for i in range_android(0, cmds.size()):
		script = script + cmds[i].get_inst() + ","
	
	return script + "}"

func clear():
	for i in range_android(0, cmds.size()):
		$ScrollContainer/CodePanel.remove_child(cmds[i])
	
	cmds.clear()

func _on_RunButton_pressed():
	emit_signal("action_request", "run", create_script())

func _on_UndoButton_pressed():
	clear()
	emit_signal("action_request", "undo")

func _on_HideButton_pressed():
	emit_signal("action_request", "hide")

func sort():
	var cur_y = 4
	
	for i in range_android(0, cmds.size()):
		cmds[i].position = Vector2(60, cur_y + cmds[i].height / 2)
		cur_y += cmds[i].height
	
	$ScrollContainer/CodePanel.rect_min_size.y = cur_y

func _on_GettersPanel_getter_called(cmd):
	cmd.ide = self
	cmds.insert(cmds.find(focused) + 1, cmd)
	$ScrollContainer/CodePanel.add_child(cmd)
	
	focus(cmd)
	sort()

func focus(cmd):
	if focused:
		focused.focus(false)
	
	cmd.focus(true)
	focused = cmd

func _on_DelButton_pressed():
	if focused:
		var new_i = cmds.find(focused) - 1
		
		$ScrollContainer/CodePanel.remove_child(focused)
		cmds.remove(new_i + 1)
		focused = cmds[new_i] if new_i >= 0 else null
		
		if focused:
			focused.focus(true)
	
		sort()
