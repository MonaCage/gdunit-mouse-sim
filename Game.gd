extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/TextureRect.texture = load("res://icon.png")
#	var timer = Timer.new()
#	add_child(timer)
#	timer.connect("timeout", self, "on_timer_timeout")
#	timer.start()

func _gui_input(event):
#	print("GUI EVENT: ", event)
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		print("GAME Left mouse button was pressed!")
	elif event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		print("GAME Left mouse button was released!")
	elif event is InputEventMouseMotion:
#		print("MOUSE MOTION: ", event.relative)
		pass

func on_timer_timeout() -> void:
	print("TIMER MOUSE POS: ", get_viewport().get_mouse_position())


func _on_Button_button_down():
	print("BUTTON DOWN")
	pass # Replace with function body.
