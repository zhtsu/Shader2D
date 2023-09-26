extends Control

# Popup
const tscn_popup = preload("res://app/popup.tscn")
const tscn_slot = preload("res://app/slot.tscn")
# Scenes for display shader
const tscn_wave = preload("res://shaders/wave/wave.tscn")
const tscn_show = preload("res://shaders/show/show.tscn")
const tscn_spiral = preload("res://shaders/spiral/spiral.tscn")
const tscn_crt = preload("res://shaders/crt/crt.tscn")
const tscn_gray = preload("res://shaders/gray/gray.tscn")
const tscn_ripple = preload("res://shaders/ripple/ripple.tscn")
const tscn_knit = preload("res://shaders/knit/knit.tscn")
const tscn_bar_transition = preload("res://shaders/bar_transition/bar_transition.tscn")


func _create_slot(res : Resource, title : String) -> Node:
	var slot = tscn_slot.instantiate()
	slot.init_slot_data(res.instantiate(), title)
	slot.connect("clicked", on_slot_clicked.bind(res.instantiate(), title))
	return slot

func _ready() -> void:
	# Viewport
	$VBoxContainer/ContentBox/RightBox/TextureRect.texture = \
		$VBoxContainer/ContentBox/RightBox/SubViewport.get_texture()
	
	var slot_list = []
	# Wave
	slot_list.append(_create_slot(tscn_wave, "Wave"))
	# Show
	slot_list.append(_create_slot(tscn_show, "Show"))
	# Spiral
	slot_list.append(_create_slot(tscn_spiral, "Spiral"))
	# CRT
	slot_list.append(_create_slot(tscn_crt, "CRT"))
	# Gray
	slot_list.append(_create_slot(tscn_gray, "Gray"))
	# Ripple
	slot_list.append(_create_slot(tscn_ripple, "Ripple"))
	# Knit
	slot_list.append(_create_slot(tscn_knit, "Knit"))
	# Bar Transition
	slot_list.append(_create_slot(tscn_bar_transition, "Bar\nTransition"))
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
	var popup_scene = tscn_popup.instantiate()
	popup_scene.init_popup("Link to github repository ?", _link_to_github_repository)
	add_child(popup_scene)
	

func _link_to_qq_group_QR_code() -> void:
	OS.shell_open("http://file.zhtsu.cc/qq_group_1065732551_QR_code.jpg")

func _on_group_button_pressed() -> void:
	var popup_scene = tscn_popup.instantiate()
	popup_scene.init_popup("Do you want to join\nthe QQ group ?", _link_to_qq_group_QR_code)
	add_child(popup_scene)
	
