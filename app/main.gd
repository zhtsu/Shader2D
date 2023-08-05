extends Control


const slot_scene_res = preload("res://app/slot.tscn")
# Scenes for display shader
const wave_scene_res = preload("res://shaders/wave/wave.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Viewport
	$VBoxContainer/ContentBox/RightBox/TextureRect.texture = \
		$VBoxContainer/ContentBox/RightBox/SubViewport.get_texture()
	var slot_list = []
	# Wave
	var wave_slot = slot_scene_res.instantiate()
	wave_slot.init_slot_data(wave_scene_res.instantiate(), "Wave")
	wave_slot.connect("clicked", on_slot_clicked.bind(wave_scene_res.instantiate(), "Wave"))
	slot_list.append(wave_slot)
	# Flashlight
	var flashlight_slot = slot_scene_res.instantiate()
	flashlight_slot.init_slot_data(null, "Flashlight")
	flashlight_slot.disable()
	slot_list.append(flashlight_slot)
	# Add to Grid from list
	for slot in slot_list:
		$VBoxContainer/ContentBox/LeftBox/GridBox/Grid.add_child(slot)
		


func on_slot_clicked(scene : Node, title : String) -> void:
	if $VBoxContainer/ContentBox/RightBox/CurrentShader.text == title:
		pass
		
	for child in $VBoxContainer/ContentBox/RightBox/SubViewport.get_children():
		$VBoxContainer/ContentBox/RightBox/SubViewport.remove_child(child)
	$VBoxContainer/ContentBox/RightBox/SubViewport.add_child(scene)
	$VBoxContainer/ContentBox/RightBox/CurrentShader.text = title


func _on_github_button_pressed() -> void:
	OS.shell_open("https://github.com/zhtsu/ShadersFor2D/")


func _on_group_button_pressed() -> void:
	OS.shell_open("http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=f\
		A4XSaxBebMykh6cbchOgHH4rfscFAVD&authKey=VgwdS%2BW2FaDj\
		21IpcEEc9lOZAWgLyYy7r9%2FxbQtzniiSmAKCZjScFIzULlU7zwD7\
		&noverify=0&group_code=1065732551")
