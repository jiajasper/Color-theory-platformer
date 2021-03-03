extends TabContainer

onready var object_cursor = get_node("/root/main/Editor_Object")


func _ready():
	mouse_filter = MOUSE_FILTER_PASS
	pass 

func _process(delta):
	if (!Global.filesystem_shown):
		if Input.is_action_just_pressed("toggle_editor"):
			Global.playing = !Global.playing
		if Input.is_action_just_pressed("exit"):
			get_tree().quit()		
	if Global.playing:
		visible = false
		object_cursor.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if !Global.playing:
		visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	pass
	
func _on_TabContainer_mouse_entered():
	object_cursor.can_place = false
	object_cursor.hide()
	pass # Replace with function body.


func _on_TabContainer_mouse_exited():
	object_cursor.can_place = true
	object_cursor.show()
	pass # Replace with function body.
