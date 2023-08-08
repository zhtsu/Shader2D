extends Control


func init_popup(message : String, yes_btn_callback : Callable) -> void:
	$Panel/VBoxContainer/TextBox/Text.text = message
	$Panel/VBoxContainer/BtnBar/YesBtn.pressed.connect(yes_btn_callback)
	
	
func destroy() -> void:
	queue_free();
	
	
func _on_no_btn_pressed() -> void:
	queue_free();
