extends Control


const slot_scene_res = preload("res://app/slot.tscn")
# Scenes for display shader
const wave_scene_res = preload("res://shaders/wave/wave.tscn")
const show_scene_res = preload("res://shaders/show/show.tscn")
const spiral_scene_res = preload("res://shaders/spiral/spiral.tscn")
const CRT_scene_res = preload("res://shaders/CRT/CRT.tscn")
const gray_scene_res = preload("res://shaders/gray/gray.tscn")


func _create_slot(res : Resource, title : String) -> Node:
	var slot = slot_scene_res.instantiate()
	slot.init_slot_data(res.instantiate(), title)
	slot.connect("clicked", on_slot_clicked.bind(res.instantiate(), title))
	return slot

func _ready() -> void:
	# Viewport
	$VBoxContainer/ContentBox/RightBox/TextureRect.texture = \
		$VBoxContainer/ContentBox/RightBox/SubViewport.get_texture()
	var slot_list = []
	# Wave
	slot_list.append(_create_slot(wave_scene_res, "Wave"))
	# Show
	slot_list.append(_create_slot(show_scene_res, "Show"))
	# Spiral
	slot_list.append(_create_slot(spiral_scene_res, "Spiral"))
	# CRT
	slot_list.append(_create_slot(CRT_scene_res, "CRT"))
	# Gray
	slot_list.append(_create_slot(gray_scene_res, "Gray"))
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
	OS.shell_open("https://github.com/zhtsu/Shader2D/")


func _on_group_button_pressed() -> void:
	OS.shell_open("http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=f\
		A4XSaxBebMykh6cbchOgHH4rfscFAVD&authKey=VgwdS%2BW2FaDj\
		21IpcEEc9lOZAWgLyYy7r9%2FxbQtzniiSmAKCZjScFIzULlU7zwD7\
		&noverify=0&group_code=1065732551")
