extends Button


signal clicked


func disable() -> void:
	disabled = true
	mouse_filter = MOUSE_FILTER_IGNORE
	$HoverMask.color = Color.from_hsv(0, 0, 0, 0.4)


func init_slot_data(scene : Node, title : String) -> void:
	text = title
	
	if scene == null:
		return
		
	$SubViewport.add_child(scene)


func _on_mouse_entered() -> void:
	$HoverMask.color = Color.from_hsv(0, 0, 1, 0.4)


func _on_mouse_exited() -> void:
	$HoverMask.color = Color.from_hsv(0, 0, 1, 0)


func _on_button_down() -> void:
	scale = Vector2(0.98, 0.98)


func _on_button_up() -> void:
	scale = Vector2(1, 1)
	emit_signal("clicked")
