extends Control

# Popup
const popup_scene_res = preload("res://app/popup.tscn")
const slot_scene_res = preload("res://app/slot.tscn")
# Scenes for display shader
const wave_scene_res = preload("res://shaders/wave/wave.tscn")
const show_scene_res = preload("res://shaders/show/show.tscn")
const spiral_scene_res = preload("res://shaders/spiral/spiral.tscn")
const CRT_scene_res = preload("res://shaders/CRT/CRT.tscn")
const gray_scene_res = preload("res://shaders/gray/gray.tscn")
const ripple_scene_res = preload("res://shaders/ripple/ripple.tscn")
const knit_scene_res = preload("res://shaders/knit/knit.tscn")


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
	# Ripple
	slot_list.append(_create_slot(ripple_scene_res, "Ripple"))
	# Knit
	slot_list.append(_create_slot(knit_scene_res, "Knit"))
	# Add to Grid from list
	for slot in slot_list:
		$VBoxContainer/ContentBox/LeftBox/GridBox/Grid.add_child(slot)
		


func on_slot_clicked(scene : Node, title : String) -> void:
	if $VBoxContainer/ContentBox/RightBox/CurrentShader.text == title:
		pass
		
	for child in $VBoxContainer/ContentBox/RightBox/SubViewport.get_children():
		$VBoxContainer/ContentBox/RightBox/SubViewport.remove_child(child)
	$VBoxContainer/ContentBox/RightBox/SubViewport.add_child(scene)
	
	title = title.replace("\n", " ")
	$VBoxContainer/ContentBox/RightBox/CurrentShader.text = title


func _link_to_github_repository() -> void:
	OS.shell_open("https://github.com/zhtsu/Shader2D/")

func _on_github_button_pressed() -> void:
	var popup_scene = popup_scene_res.instantiate()
	popup_scene.init_popup("Link to github repository ?", _link_to_github_repository)
	add_child(popup_scene)
	

func _link_to_qq_group_QR_code() -> void:
	OS.shell_open("http://file.zhtsu.cc/qq_group_1065732551_QR_code.jpg")

func _on_group_button_pressed() -> void:
	var popup_scene = popup_scene_res.instantiate()
	popup_scene.init_popup("Do you want to join\nthe QQ group ?", _link_to_qq_group_QR_code)
	add_child(popup_scene)
	
