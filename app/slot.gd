extends Button


signal clicked


func init_slot_data(scene : Node, title : String) -> void:
	$SubViewport.add_child(scene)
	text = title


func _on_mouse_entered() -> void:
	$HoverMask.color = Color.from_hsv(0, 0, 0, 0.4)


func _on_mouse_exited() -> void:
	$HoverMask.color = Color.from_hsv(0, 0, 0, 0)


func _on_button_down() -> void:
	scale = Vector2(0.98, 0.98)


func _on_button_up() -> void:
	scale = Vector2(1, 1)
	emit_signal("clicked")
