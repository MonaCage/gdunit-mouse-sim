extends PanelContainer


func get_drag_data(_pos) -> Dictionary:
	var data: Dictionary
	data["texture"] = $TextureRect.texture
	
	var drag_texture := TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = $TextureRect.texture
	drag_texture.rect_size = Vector2(89,89)
	
	var control := Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	
	set_drag_preview(control)
	return data


func can_drop_data(_pos, data: Dictionary) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("texture")


func drop_data(_pos, data: Dictionary) -> void:
	var origin_slot := data["texture"] as StreamTexture
	
	if origin_slot != null:
		$TextureRect.texture = origin_slot

func _gui_input(event):
#	print("PANEL GUI EVENT: ", event)
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		print("PANEL Left mouse button was pressed!")
	elif event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		print("PANEL Left mouse button was released!")
	elif event is InputEventMouseMotion:
#		print("PANEL MOUSE MOTION: ", event.relative)
		pass
