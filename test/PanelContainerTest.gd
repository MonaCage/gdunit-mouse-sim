# GdUnit generated TestSuite
#warning-ignore-all:unused_argument
#warning-ignore-all:return_value_discarded
class_name PanelContainerTest
extends GdUnitTestSuite

# TestSuite generated from
const __source = 'res://PanelContainer.gd'

func test_simulate_mouse_move() -> void:
	OS.window_minimized = false
	var runner := scene_runner("res://Game.tscn")
	yield(await_millis(2000), "completed")
	
	print("MOUSE POS: ", get_viewport().get_mouse_position())
	runner.set_mouse_pos(Vector2(100, 100))
	yield(await_millis(100), "completed")
	print("MOUSE POS: ", get_viewport().get_mouse_position())
	yield(await_millis(1900), "completed")
	
	print("SIMULATE MOUSE MOVE")
	runner.simulate_mouse_move(Vector2(200, 200))
	yield(await_millis(2000), "completed")
	print("MOUSE SHOULD HAVE MOVED TO (300, 300)") # 300 if its relative, 200 if absolute
	print("MOUSE POS: ", get_viewport().get_mouse_position())
	
	runner.simulate_mouse_button_release(BUTTON_LEFT)
	yield(await_millis(2000), "completed")

func test_mouse_press() -> void:
	var runner := scene_runner("res://Game.tscn")
	OS.window_minimized = false
	yield(await_millis(2000), "completed")
	
	print("SIMULATE MOUSE BUTTON PRESSED ", get_viewport().get_mouse_position())
	runner.simulate_mouse_button_press(BUTTON_LEFT)
	yield(await_millis(500), "completed")
	print("Is MB pressed? ", Input.is_mouse_button_pressed(BUTTON_LEFT))
	assert_bool(Input.is_mouse_button_pressed(BUTTON_LEFT)).is_true()
	yield(await_millis(2000), "completed")

func test_drop_data() -> void:
	var runner := scene_runner("res://Game.tscn")
	OS.window_minimized = false
	yield(await_millis(2000), "completed")
	
	var slot1 = $"/root/Game/Panel/TextureRect" as TextureRect
	print("SLOT1 POS: ", slot1.rect_global_position)
	var slot2 = $"/root/Game/Panel2/TextureRect" as TextureRect
	print("SLOT2 POS: ", slot2.rect_global_position)
	yield(await_millis(2000), "completed")
	
	print("SET MOUSE POS ", get_viewport().get_mouse_position())
	runner.set_mouse_pos(slot1.rect_global_position)
	yield(await_millis(2000), "completed")
	
	print("SIMULATE MOUSE BUTTON PRESSED ", get_viewport().get_mouse_position())
	runner.simulate_mouse_button_press(BUTTON_LEFT)
	Input.is_mouse_button_pressed(BUTTON_LEFT)
	yield(await_millis(2000), "completed")
	
	print("SIMULATE MOUSE MOVEMENT ", get_viewport().get_mouse_position())
	runner.simulate_mouse_move(slot2.rect_global_position)
	yield(await_millis(2000), "completed")
	
	print("SIMULATE MOUSE BUTTON RELEASED ", get_viewport().get_mouse_position())
	runner.simulate_mouse_button_release(BUTTON_LEFT)
	# do an extra wait to finish the drop
	yield(await_millis(2000), "completed")
	print("SLOT1: ", slot1.texture)
	print("SLOT2: ", slot2.texture)
